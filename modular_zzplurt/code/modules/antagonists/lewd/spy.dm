// Lewd replacement for the standard Spy.
/datum/antagonist/spy
	name = "\improper Lewd Spy"
	lewd_flavor = TRUE
	lewd_intro = "Every asset is a conquest. Extract their secrets and their pleasure."
	lewd_kit = list(
		/obj/item/clothing/sextoy/dildo,
		/obj/item/clothing/sextoy/vibrator,
		/obj/item/reagent_containers/applicator/pill/rutt,
	)

/datum/antagonist/spy/on_gain()
	. = ..()
	apply_lewd_rework()

