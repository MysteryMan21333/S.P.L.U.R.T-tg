// Lewd replacement for the standard Space Wizard.
/datum/antagonist/wizard
	name = "\improper Lewd Space Wizard"
	lewd_flavor = TRUE
	lewd_intro = "Your magic knows no bounds, and neither does your appetite. Enchant and entrance the crew."
	lewd_kit = list(
		/obj/item/reagent_containers/cup/bottle/rutt,
		/obj/item/clothing/sextoy/dildo,
	)

/datum/antagonist/wizard/on_gain()
	. = ..()
	apply_lewd_rework()

