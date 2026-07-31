package handlers

import (
	"fmt"

	tgbotapi "github.com/go-telegram-bot-api/telegram-bot-api/v5"

	"appbuilder-bot/backend/api"
	"appbuilder-bot/backend/utils"
)

// HandleInfo фармони /info ва тугмаи "ℹ️ Маълумот"-ро коркард мекунад —
// маълумот дар бораи бот ва шумораи умумии корбаронро нишон медиҳад
func HandleInfo(d *Deps, msg *tgbotapi.Message) {
	lang := getUserLang(d, msg.From.ID)

	count, err := d.Stats.UserCount()
	if err != nil {
		utils.LogError("info: failed to get user count: %v", err)
		// шумораро гирифта натавонистем — бо "?" нишон медиҳем, вале
		// маълумоти ботро ҳамоно нишон медиҳем
		count = -1
	}

	countStr := "—"
	if count >= 0 {
		countStr = fmt.Sprintf("%d", count)
	}

	text := fmt.Sprintf(api.GetMessage(lang, "info_text"), countStr)
	sendTextMarkdown(d, msg.Chat.ID, text)
}
