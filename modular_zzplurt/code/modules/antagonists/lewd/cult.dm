// Lewd replacement for the standard Blood Cult. Covers both the roundstart
// Cultist and the Acolyte rolls, which both use /datum/antagonist/cult.
/datum/antagonist/cult
	name = "Lewd Cultist"
	lewd_flavor = TRUE
	lewd_intro = "The Geometer demands devotion of a more intimate kind. Corrupt and claim the crew."
	lewd_kit = list(
		/obj/item/clothing/sextoy/dildo,
		/obj/item/reagent_containers/applicator/pill/rutt,
		/obj/item/reagent_containers/applicator/pill/rutt,
	)

/datum/antagonist/cult/on_gain()
	. = ..()
	apply_lewd_rework()

