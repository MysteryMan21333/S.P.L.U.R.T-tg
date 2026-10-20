// Lewd antagonist framework.
//
// These modular overrides retheme the server's standard antagonists into their
// lewd counterparts. Because modular_zzplurt compiles after the upstream code,
// the re-declarations below take precedence without ever touching upstream files.
//
// This relies on two BYOND behaviours:
//  * Same-type variable overrides replace the upstream value.
//  * Same-type proc overrides chain to the upstream definition via ..().


// ---- Lewd objectives ----

/// A lewd-styled objective. Base type; use the concrete subtypes below.
/datum/objective/lewd
	name = "lewd objective"
	admin_grantable = TRUE

/// Impregnate a targeted crewmember.
/datum/objective/lewd/breed
	name = "breed"
	martyr_compatible = TRUE

/datum/objective/lewd/breed/check_completion()
	if(!target)
		return TRUE
	var/mob/living/carbon/target_mob = target.current
	if(!istype(target_mob))
		return FALSE
	return target_mob.GetComponent(/datum/component/pregnant) != null

/datum/objective/lewd/breed/update_explanation_text()
	..()
	if(target?.current)
		explanation_text = "Impregnate [target.name], the [target.assigned_role.title]."
	else
		explanation_text = "Free objective."

/// Make a targeted crewmember submit to you.
/datum/objective/lewd/debauch
	name = "debauch"
	martyr_compatible = TRUE

/datum/objective/lewd/debauch/check_completion()
	if(!target)
		return TRUE
	return completed || (!considered_alive(target) || considered_afk(target) || considered_exiled(target))

/datum/objective/lewd/debauch/update_explanation_text()
	..()
	if(target?.current)
		explanation_text = "Make [target.name], the [target.assigned_role.title], submit to you."
	else
		explanation_text = "Free objective."

/// Bring a targeted crewmember to climax.
/datum/objective/lewd/seduce
	name = "seduce"
	martyr_compatible = TRUE

/datum/objective/lewd/seduce/find_target(dupe_search_range, list/blacklist)
	. = ..()
	if(target?.current)
		RegisterSignal(target.current, COMSIG_MOB_POST_CLIMAX, PROC_REF(on_target_climax))
	return .

/datum/objective/lewd/seduce/check_completion()
	if(!target)
		return TRUE
	return completed

/datum/objective/lewd/seduce/update_explanation_text()
	..()
	if(target?.current)
		explanation_text = "Bring [target.name], the [target.assigned_role.title], to climax."
	else
		explanation_text = "Free objective."

/datum/objective/lewd/seduce/Destroy()
	if(target?.current)
		UnregisterSignal(target.current, COMSIG_MOB_POST_CLIMAX)
	return ..()

/datum/objective/lewd/seduce/proc/on_target_climax(mob/source, mob/living/partner, interaction_position, manual)
	SIGNAL_HANDLER
	completed = TRUE

/// Collect a number of sex toys.
/datum/objective/lewd/collect_toys
	name = "collect toys"
	/// How many sex toys the antagonist must end the round holding.
	var/required_toys = 3

/datum/objective/lewd/collect_toys/find_target(dupe_search_range, list/blacklist)
	explanation_text = "Collect [required_toys] sex toys."
	return null

/datum/objective/lewd/collect_toys/check_completion()
	var/mob/living/lewd_mob = owner?.current
	if(!istype(lewd_mob))
		return FALSE
	var/toy_count = 0
	for(var/obj/item/clothing/sextoy/toy in lewd_mob.get_all_contents())
		toy_count++
	return toy_count >= required_toys


// ---- Lewd antagonist helpers ----

/datum/antagonist
	/// Whether this antagonist is a lewd replacement, enabling lewd round-end flavor.
	var/lewd_flavor = FALSE
	/// Player-facing intro text printed when the antagonist is gained.
	var/lewd_intro
	/// List of item typepaths granted to human owners on gain.
	var/list/lewd_kit = list(
		/obj/item/clothing/sextoy/dildo,
		/obj/item/clothing/sextoy/vibrator,
		/obj/item/reagent_containers/applicator/pill/rutt,
		/obj/item/reagent_containers/applicator/pill/rutt,
	)

/// Runs the full lewd rework: greeting, kit, and objective.
/datum/antagonist/proc/apply_lewd_rework()
	greet_lewd()
	grant_lewd_kit()
	forge_lewd_objectives()

/// Prints this antagonist's lewd intro text.
/datum/antagonist/proc/greet_lewd()
	if(!lewd_intro || !owner)
		return
	to_chat(owner, span_userlove(lewd_intro))

/// Grants a lewd starter kit (items + arouse ability) to a human owner.
/datum/antagonist/proc/grant_lewd_kit()
	var/mob/living/carbon/human/lewd_mob = owner?.current
	if(!istype(lewd_mob))
		return

	for(var/loot_path in lewd_kit)
		var/obj/item/new_item = new loot_path
		if(!lewd_mob.put_in_hands(new_item))
			new_item.forceMove(get_turf(lewd_mob))

	var/datum/action/cooldown/lewd/arouse/arouse_action = new(lewd_mob)
	arouse_action.Grant(lewd_mob)

	to_chat(lewd_mob, span_userlove("A warm, lewd tingle runs through you as your \"personal entertainment\" materializes on your person. Put it to good use."))

/// Adds a single lewd objective to this antagonist and announces it.
/datum/antagonist/proc/forge_lewd_objectives()
	var/datum/objective/lewd/new_objective
	if(!ishuman(owner?.current))
		new_objective = new /datum/objective/lewd/debauch()
	else
		var/objective_type = pick(list(
			/datum/objective/lewd/breed,
			/datum/objective/lewd/debauch,
			/datum/objective/lewd/seduce,
			/datum/objective/lewd/collect_toys,
		))
		new_objective = new objective_type()

	new_objective.owner = owner
	new_objective.find_target()
	objectives += new_objective
	to_chat(owner, span_boldnotice("You have been given a lewd objective: [new_objective.explanation_text]"))

/// Lewd round-end report for lewd antagonists.
/datum/antagonist/roundend_report()
	if(!lewd_flavor)
		return ..()

	var/list/report = list()

	if(!owner)
		CRASH("Antagonist datum without owner")

	report += printplayer(owner)

	var/objectives_complete = TRUE
	if(objectives.len)
		report += printobjectives(objectives)
		for(var/datum/objective/objective in objectives)
			if(!objective.check_completion())
				objectives_complete = FALSE
				break

	if(objectives.len == 0 || objectives_complete)
		report += span_greentext("The [name] climaxed successfully!")
	else
		report += span_redtext("The [name] couldn't get off and has failed!")

	return report.Join("<br>")

