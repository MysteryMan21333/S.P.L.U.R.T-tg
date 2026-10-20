// Lewd replacement for the standard Nuclear Operative.
/datum/antagonist/nukeop
	name = "Lewd Nuclear Operative"
	lewd_flavor = TRUE
	lewd_intro = "Before the station burns, enjoy its pleasures. Take what you want."
	lewd_kit = list(
		/obj/item/clothing/sextoy/dildo,
		/obj/item/clothing/sextoy/vibrator,
		/obj/item/reagent_containers/applicator/pill/rutt,
		/obj/item/reagent_containers/applicator/pill/rutt,
	)

/datum/antagonist/nukeop/on_gain()
	. = ..()
	apply_lewd_rework()

