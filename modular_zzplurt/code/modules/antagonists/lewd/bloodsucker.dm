// Lewd replacement for the standard Bloodsucker.
/datum/antagonist/bloodsucker
	name = "\improper Lewd Bloodsucker"
	lewd_flavor = TRUE
	lewd_intro = "Your thirst is not only for blood. Take what you desire from the crew."
	lewd_kit = list(
		/obj/item/reagent_containers/applicator/pill/rutt,
		/obj/item/reagent_containers/applicator/pill/rutt,
		/obj/item/reagent_containers/cup/bottle/rutt,
	)

/datum/antagonist/bloodsucker/on_gain()
	. = ..()
	apply_lewd_rework()

