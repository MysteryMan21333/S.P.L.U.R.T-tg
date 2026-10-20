// Lewd replacement for the standard Head Revolutionary.
/datum/antagonist/rev/head
	name = "\improper Lewd Head Revolutionary"
	lewd_flavor = TRUE
	lewd_intro = "Liberate the crew from the tyranny of command, one seduction at a time."
	lewd_kit = list(
		/obj/item/clothing/sextoy/dildo,
		/obj/item/clothing/sextoy/vibrator,
		/obj/item/reagent_containers/applicator/pill/rutt,
		/obj/item/reagent_containers/applicator/pill/rutt,
	)

/datum/antagonist/rev/head/on_gain()
	. = ..()
	apply_lewd_rework()

