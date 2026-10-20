// Lewd replacement for the standard Blood Worm.
/datum/antagonist/blood_worm
	name = "\improper Lewd Blood Worm"
	lewd_flavor = TRUE
	lewd_intro = "Your urge to breed and multiply cannot be contained. Find a host and make them yours."
	lewd_kit = list(
		/obj/item/clothing/sextoy/dildo,
		/obj/item/reagent_containers/applicator/pill/rutt,
		/obj/item/reagent_containers/applicator/pill/rutt,
	)

/datum/antagonist/blood_worm/on_gain()
	. = ..()
	apply_lewd_rework()

