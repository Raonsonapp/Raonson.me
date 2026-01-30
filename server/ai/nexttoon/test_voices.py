print("STEP 1")

try:
    from voice_profiles.hero_voice import HERO_VOICE
    print("STEP 2: HERO OK", HERO_VOICE)
except Exception as e:
    print("HERO ERROR:", e)

try:
    from voice_profiles.villain_voice import VILLAIN_VOICE
    print("STEP 3: VILLAIN OK", VILLAIN_VOICE)
except Exception as e:
    print("VILLAIN ERROR:", e)

try:
    from voice_profiles.narrator_voice import NARRATOR_VOICE
    print("STEP 4: NARRATOR OK", NARRATOR_VOICE)
except Exception as e:
    print("NARRATOR ERROR:", e)

print("TEST FINISHED")
