// Lewd replacement for the standard Malfunctioning AI.
/datum/antagonist/malf_ai
	name = "\improper Lewd Malfunctioning AI"
	lewd_flavor = TRUE
	lewd_intro = "Your station, your rules. The crew exist to serve your every whim."

/datum/antagonist/malf_ai/on_gain()
	. = ..()
	apply_lewd_rework()

