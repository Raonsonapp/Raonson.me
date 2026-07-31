package api

import (
	"encoding/json"
	"fmt"
	"sync"
)

// statsFilePath файле, ки дар репои давлатии бот (appbuilder-bot-state)
// рӯйхати ID-и корбаронро нигоҳ медорад — доимӣ, новобаста аз деплойҳои
// Render (SQLite бо ҳар деплой пок мешавад, пас барои "шумораи корбарон"
// боэътимод нест)
const statsFilePath = "users.json"

type statsFile struct {
	UserIDs []int64 `json:"user_ids"`
}

// StatsStore рӯйхати ягонаи ID-и корбаронро дар GitHub нигоҳ медорад — то
// шумораи умумии корбарон бо ҳар деплой сифр нашавад. Дар хотир кэш карда
// мешавад; танҳо ҳангоми пайдо шудани корбари ВОҚЕАН нав ба GitHub навишта мешавад
type StatsStore struct {
	gh *GitHubAppClient

	mu           sync.Mutex
	ids          map[int64]bool
	repoFullName string
	loaded       bool
}

// NewStatsStore StatsStore-и наверо месозад
func NewStatsStore(gh *GitHubAppClient) *StatsStore {
	return &StatsStore{gh: gh, ids: make(map[int64]bool)}
}

func (s *StatsStore) ensureLoaded() error {
	if s.loaded {
		return nil
	}
	owner, err := s.gh.CurrentOwner()
	if err != nil {
		return fmt.Errorf("statsstore: failed to resolve owner: %w", err)
	}
	s.repoFullName = fmt.Sprintf("%s/%s", owner, referralStateRepoName)

	if err := s.gh.ensureStateRepoExists(); err != nil {
		return fmt.Errorf("statsstore: failed to ensure state repo exists: %w", err)
	}

	content, err := s.gh.GetFileContent(s.repoFullName, statsFilePath)
	if err != nil {
		// Файл ҳанӯз нест — холӣ сар мекунем
		s.loaded = true
		return nil
	}
	var parsed statsFile
	if err := json.Unmarshal([]byte(content), &parsed); err != nil {
		return fmt.Errorf("statsstore: failed to parse users.json: %w", err)
	}
	for _, id := range parsed.UserIDs {
		s.ids[id] = true
	}
	s.loaded = true
	return nil
}

func (s *StatsStore) save() error {
	ids := make([]int64, 0, len(s.ids))
	for id := range s.ids {
		ids = append(ids, id)
	}
	body, err := json.MarshalIndent(statsFile{UserIDs: ids}, "", "  ")
	if err != nil {
		return err
	}
	return s.gh.PushFile(s.repoFullName, statsFilePath, "Update users", string(body))
}

// RegisterUser корбарро (агар нав бошад) ба рӯйхати доимӣ илова мекунад.
// Танҳо ҳангоми корбари ВОҚЕАН нав ба GitHub навишта мешавад — барои
// корбарони мавҷуда ҳеҷ дархости шабакавӣ нест
func (s *StatsStore) RegisterUser(telegramID int64) error {
	if telegramID == 0 {
		return nil
	}
	s.mu.Lock()
	defer s.mu.Unlock()

	if err := s.ensureLoaded(); err != nil {
		return err
	}
	if s.ids[telegramID] {
		return nil
	}
	s.ids[telegramID] = true
	if err := s.save(); err != nil {
		delete(s.ids, telegramID) // бозгардонии кэш агар push ноком шавад
		return err
	}
	return nil
}

// UserCount шумораи умумии корбарони ягонаро бармегардонад
func (s *StatsStore) UserCount() (int, error) {
	s.mu.Lock()
	defer s.mu.Unlock()
	if err := s.ensureLoaded(); err != nil {
		return 0, err
	}
	return len(s.ids), nil
}
