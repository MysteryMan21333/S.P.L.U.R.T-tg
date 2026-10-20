// Lewd replacement for the standard Clown Operative.
/datum/antagonist/nukeop/clownop
	name = "Lewd Clown Operative"
	lewd_flavor = TRUE
	lewd_intro = "Honk, slip, and titillate. The Syndicate wants you to debase the station, clown style."
	lewd_kit = list(
		/obj/item/clothing/sextoy/dildo,
		/obj/item/clothing/sextoy/vibrator,
		/obj/item/reagent_containers/applicator/pill/rutt,
	)

/datum/antagonist/nukeop/clownop/on_gain()
	. = ..()
	apply_lewd_rework()

