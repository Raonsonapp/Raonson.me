
def plan_episode(duration_minutes):
    scenes = duration_minutes * 6
    return [f"Scene {i}" for i in range(1, scenes+1)]
