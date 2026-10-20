// Lewd replacement for the standard Traitor.
/datum/antagonist/traitor
	name = "\improper Lewd Traitor"
	lewd_flavor = TRUE
	lewd_intro = "Your Syndicate handlers have other plans for you. Seduce, subvert, and satisfy your way to victory."
	lewd_kit = list(
		/obj/item/clothing/sextoy/dildo,
		/obj/item/clothing/sextoy/vibrator,
		/obj/item/reagent_containers/applicator/pill/rutt,
		/obj/item/reagent_containers/applicator/pill/rutt,
	)

/datum/antagonist/traitor/on_gain()
	. = ..()
	apply_lewd_rework()

