// Lewd active ability granted to human lewd antagonists.

/datum/action/cooldown/lewd/arouse
	name = "Arouse"
	desc = "Whisper sweet nothings and flood a nearby creature with arousal."
	cooldown_time = 20 SECONDS

/datum/action/cooldown/lewd/arouse/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return FALSE

	var/mob/living/carbon/human/user = owner
	if(!istype(user))
		return FALSE

	var/list/nearby_mobs = list()
	for(var/mob/living/carbon/human/possible_target in view(2, user))
		if(possible_target == user)
			continue
		nearby_mobs += possible_target

	if(!length(nearby_mobs))
		user.balloon_alert(user, "no one nearby!")
		return FALSE

	var/mob/living/carbon/human/target_mob = input(user, "Arouse whom?", "Seduce") as null|anything in nearby_mobs
	if(!istype(target_mob) || QDELETED(target_mob))
		return FALSE

	StartCooldown()
	user.visible_message(span_lewd("[user] whispers something lewd to [target_mob]..."), span_userlove("You whisper lewd nothings to [target_mob]."))
	target_mob.adjust_arousal(25)
	to_chat(target_mob, span_userlove("A sudden wave of arousal washes over you!"))
	return TRUE
