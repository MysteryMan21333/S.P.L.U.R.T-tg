// Lewd replacement for the standard Changeling.
/datum/antagonist/changeling
	name = "\improper Lewd Changeling"
	lewd_flavor = TRUE
	lewd_intro = "Your pheromones are your deadliest weapon. Absorb their essence one climax at a time."
	lewd_kit = list(
		/obj/item/clothing/sextoy/vibrator,
		/obj/item/reagent_containers/applicator/pill/rutt,
		/obj/item/reagent_containers/applicator/pill/rutt,
		/obj/item/reagent_containers/applicator/pill/rutt,
	)

/datum/antagonist/changeling/on_gain()
	. = ..()
	apply_lewd_rework()

