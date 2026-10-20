// Lewd replacement for the standard Blood Brother.
/datum/antagonist/brother
	name = "\improper Lewd Blood Brother"
	lewd_flavor = TRUE
	lewd_intro = "Bound by more than blood, you and your brother share everything, including your appetites."
	lewd_kit = list(
		/obj/item/clothing/sextoy/dildo,
		/obj/item/clothing/sextoy/vibrator,
		/obj/item/reagent_containers/applicator/pill/rutt,
		/obj/item/reagent_containers/applicator/pill/rutt,
	)

/datum/antagonist/brother/on_gain()
	. = ..()
	apply_lewd_rework()

