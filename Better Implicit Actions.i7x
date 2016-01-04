Version 1/160104 of Better Implicit Actions by Ian Bollinger begins here.

"Provides alternate responses when some implicit actions occur."

Use authorial modesty.

Chapter 1 - Verbs

To fail is a verb.
To insert is a verb.
To throw is a verb.

Chapter 2 - Implicit taking

Section 2.1 - Only print implicit taking response if taking succeeds

Include (-
	[ ImplicitTake obj ks;
		@push keep_silent;
		keep_silent = true;
		@push say__p;
		@push say__pc;
		ClearParagraphing(4);
		TryAction(act_requester, actor, ##Take, obj, nothing);
		DivideParagraphPoint();
		@pull say__pc;
		@pull say__p;
		AdjustParagraphPoint();
		@pull keep_silent;
		if (obj in actor) {
			if (actor == player) {
				STANDARD_IMPLICIT_TAKING_RM('A', obj);
			} else if (TestVisibility(player, actor)) {
				STANDARD_IMPLICIT_TAKING_RM('B', obj, actor);
			}
			ClearParagraphing(3);
		}
		return obj in actor;
	];
	-) instead of "Implicit Take" in "Actions.i6t".

Section 2.2 - Standard implicit taking response

The standard implicit taking rule response (A) is
	"[We] [take] [the noun]. ".

The standard implicit taking rule response (B) is
	"[The actor] [take] [the noun]. ".

Section 2.3 - Implicit taking before putting something on

The putting it on action has a truth state called implicitly taken before
putting something on. The better the can't put what's not held rule is listed
instead of the can't put what's not held rule in the check putting it on
rulebook. This is the better the can't put what's not held rule:
	if the actor is not carrying the noun and the actor is not wearing the noun:
		silently try the actor trying taking the noun;
		if the actor is carrying the noun:
			now implicitly taken before putting something on is true;
		otherwise:
			stop the action.

The implicit taking before putting rule is listed before the standard report
putting rule in the report putting it on rulebook. Report an actor putting
something on (this is the implicit taking before putting rule):
	if implicitly taken before putting something on is true:
		if the action is not silent:
			if the actor is the player:
				say "[We] [take] [the noun] and [put] [it] on [the second
				noun]." (A);
			otherwise:
				say "[The actor] [take] [the noun] and [put] [it] on [the
				second noun]." (B);
		stop the action.

Section 2.4 - Implicit taking before inserting something into

The inserting it into action has a truth state called implicitly taken before
inserting something into. The better can't insert what's not held rule is listed
instead of the can't insert what's not held rule in the check inserting it into
rulebook. This is the better can't insert what's not held rule:
	if the actor is not carrying the noun and the actor is not wearing the noun:
		silently try the actor taking the noun;
		if the actor is carrying the noun:
			now implicitly taken before inserting something into is true;
		otherwise:
			stop the action.

The implicit taking before inserting rule is listed before the standard report
inserting rule in the report inserting it into rulebook. Report an actor
inserting something into (this is the implicit taking before inserting rule):
	if implicitly taken before inserting something into is true:
		if the action is not silent:
			if the actor is the player:
				say "[We] [take] [the noun] and [insert] [it] into [the second
				noun]." (A);
			otherwise:
				say "[The actor] [take] [the noun] and [insert] [it] into
				[the second noun]." (B);
		stop the action.

Section 2.5 - Implicit taking before eating

The eating action has a truth state called implicitly taken before eating. The
better can't eat portable food without carrying it rule is listed instead of the
can't eat portable food without carrying it rule in the check eating rulebook.
This is the better can't eat portable food without carrying it rule:
	if the noun is portable and the actor is not carrying the noun:
		silently try the actor taking the noun;
		if the actor is carrying the noun:
			now implicitly taken before eating is true;
		otherwise:
			stop the action.

The implicit taking before eating rule is listed before the standard report
eating rule in the report eating rulebook. Report an actor eating (this is the
implicit taking before eating rule):
	if implicitly taken before eating is true:
		if the action is not silent:
			if the actor is the player:
				say "[We] [take] [the noun] and [eat] [it]." (A);
			otherwise:
				say "[The actor] [take] [the noun] and [eat] [it]." (B);
		stop the action.

Chapter 3 - Implicit taking off

Section 3.1 - Implicit taking off before dropping

The dropping action has a truth state called implicitly taken off before
dropping. The better can't drop clothes being worn rule is listed instead of the
can't drop clothes being worn rule in the check dropping rulebook. This is the
better can't drop clothes being worn rule:
	if the actor is wearing the noun:
		silently try the actor trying taking off the noun;
		if the actor is not wearing the noun:
			now implicitly taken off before dropping is true;
		otherwise:
			stop the action.

The implicit taking off before dropping rule is listed before the standard
report dropping rule in the report dropping rulebook. Report an actor dropping
(this is the implicit taking off before dropping rule):
	if implicitly taken off before dropping is true:
		if the action is not silent:
			if the actor is the player:
				say "[We] [take] off [the noun] and [drop] [it]." (A);
			otherwise:
				say "[The actor] [take] off [the noun] and [drop] [it]." (B);
		stop the action.

Section 3.2 - Implicit taking off before putting something on

The putting it on action has a truth state called implicitly taken off before
putting something on. The better the can't put clothes being worn rule is listed
instead of the can't put clothes being worn rule in the check putting it on
rulebook. This is the better the can't put clothes being worn rule:
	if the actor is wearing the noun:
		silently try the actor trying taking off the noun;
		if the actor is not wearing the noun:
			now implicitly taken off before putting something on is true;
		otherwise:
			stop the action.

The implicit taking off before putting rule is listed before the standard report
putting rule in the report putting it on rulebook. Report an actor putting
something on (this is the implicit taking off before putting rule):
	if implicitly taken off before putting something on is true:
		if the action is not silent:
			if the actor is the player:
				say "[We] [take] off [the noun] and [put] [it] on [the second
				noun]." (A);
			otherwise:
				say "[The actor] [take] off [the noun] and [put] [it] on [the
				second noun]." (B);
		stop the action.

Section 3.3 - Implicit taking off before inserting

The inserting it into action has a truth state called implicitly taken off
before inserting something into. The better the can't insert clothes being worn
rule is listed instead of the can't insert clothes being worn rule in the check
inserting it into rulebook. This is the better the can't insert clothes being
worn rule:
	if the actor is wearing the noun:
		silently try the actor trying taking off the noun;
		if the actor is not wearing the noun:
			now implicitly taken off before inserting something into is true;
		otherwise:
			stop the action.

The implicit taking off before inserting rule is listed before the standard
report inserting rule in the report inserting it into rulebook. Report an actor
inserting something into (this is the implicit taking off before inserting
rule):
	if implicitly taken off before inserting something into is true:
		if the action is not silent:
			if the actor is the player:
				say "[We] [take] off [the noun] and [insert] [it] into [the
				second noun]." (A);
			otherwise:
				say "[The actor] [take] off [the noun] and [insert] [it] into
				[the second noun]." (B);
		stop the action.

Section 3.4 - Implicit taking off before eating

The eating action has a truth state called implicitly taken off before eating.
The better can't eat clothing without removing it first rule is listed instead
of the can't eat clothing without removing it first rule in the check eating
rulebook. This is the better can't eat clothing without removing it first rule:
	if the actor is wearing the noun:
		silently try the actor trying taking off the noun;
		if the actor is not wearing the noun:
			now implicitly taken off before eating is true;
		otherwise:
			stop the action.

The implicit taking off before eating rule is listed before the standard report
eating rule in the report eating rulebook. Report an actor eating (this is the
implicit taking off before eating rule):
	if implicitly taken off before eating is true:
		if the action is not silent:
			if the actor is the player:
				say "[We] [take] off [the noun] and [eat] [it]." (A);
			otherwise:
				say "[The actor] [take] off [the noun] and [eat] [it]." (B);
		stop the action.

Section 3.5 - Implicit taking off before giving something to

The giving it to action has a truth state called implicitly taken off before
giving something to. The better can't give clothes being worn rule is listed
instead of the can't give clothes being worn rule in the check giving it to
rulebook. This is the better can't give clothes being worn rule:
	if the actor is wearing the noun:
		silently try the actor trying taking off the noun;
		if the actor is not wearing the noun:
			now implicitly taken off before giving something to is true;
		otherwise:
			stop the action.

The implicit taking off before giving rule is listed before the standard report
giving rule in the report giving it to rulebook. Report an actor giving
something to (this is the implicit taking off before giving rule):
	if implicitly taken off before giving something to is true:
		if the action is not silent:
			if the actor is the player:
				say "[We] [take] off [the noun] and [give] [it] to [the second
				noun]." (A);
			otherwise:
				say "[The actor] [take] off [the noun] and [give] [it] to [the
				second noun]." (B);
		stop the action.

Section 3.6 - Implicit taking off before throwing something at

The throwing it at action has a truth state called implicitly taken off before
throwing something at. The better implicitly remove thrown clothing rule is
listed instead of the implicitly remove thrown clothing rule in the check
throwing it at rulebook. This is the better implicitly remove thrown clothing
rule:
	if the actor is wearing the noun:
		silently try the actor trying taking off the noun;
		if the actor is not wearing the noun:
			now implicitly taken off before throwing something at is true;
		otherwise:
			stop the action.

The implicit taking off before throwing rule is listed before the block throwing
at rule in the check throwing it at rulebook. This is the implicit taking off
before throwing rule:
	if implicitly taken off before throwing something at is true:
		if the action is not silent:
			if the actor is the player:
				say "[We] [take] off [the noun] but [fail] to [throw] [it] at
				[the second noun]." (A);
			otherwise:
				say "[The actor] [take] off [the noun] but [fail] to [throw]
				[it] at [the second noun]." (B);
		stop the action.

Chapter 4 - Implicit actions before going

Section 4.1 - Implicit getting off before going

The going action has an object called enterable implicitly gotten off. The
better stand up before going rule is listed instead of the stand up before going
rule in the check going rulebook. Check an actor going when the actor is on a
supporter (called the chaise) (this is the better stand up before going rule):
	silently try the actor exiting;
	if the actor is not on the chaise:
		now enterable implicitly gotten off is the chaise;
	otherwise:
		stop the action.

The implicit getting off before going rule is listed before the describe room
gone into rule in the report going rulebook. Report an actor going (this is the
implicit getting off before going rule):
	if the enterable implicitly gotten off is something and the action is not
	silent:
		if the actor is the player:
			say "[We] [get] off [the enterable implicitly gotten off].[command
			clarification break]" (A);
		otherwise:
			say "[The actor] [get] off [the enterable implicitly gotten off] and
			[run paragraph on]" (B);

Section 4.2 - Implicit opening before going

The going action has a truth state called implicitly opening before going. The
better can't go through closed doors rule is listed instead of the can't go
through closed doors rule in the check going rulebook. This is the better can't
go through closed doors rule:
	if the door gone through is not nothing and the door gone through is closed:
		silently try the actor opening the door gone through;
		if the door gone through is open:
			now implicitly opening before going is true;
		otherwise:
			stop the action.

The implicit opening before going rule is listed before the describe room gone
into rule in the report going rulebook. Report an actor going (this is the
implicit opening before going rule):
	if implicitly opening before going is true and the action is not silent:
		if the actor is the player:
			say "[We] [open] the [door gone through].[command clarification
			break]" (A);
		otherwise:
			say "[The actor] [open] the [door gone through] and [run paragraph
			on]" (B);

Section 4.3 - Reporting actors' movement

The implicit action before going rule is listed before the describe room gone
into rule in the report going rulebook. Report an actor going (this is the
implicit action before going rule):
	if the actor is not the player and the enterable implicitly gotten off is
	something or implicitly opening before going is true:
		if the noun is a direction:
			if the location is the room gone from or the player is within the
			vehicle gone by or the player is within the thing gone with:
				if the room gone from is the room gone to:
					continue the action;
				otherwise:
					if the noun is up:
						say "[go] up" (A);
					otherwise if the noun is down:
						say "[go] down" (B);
					otherwise:
						say "[go] [noun]" (C);
			otherwise:
				let the back way be the opposite of the noun;
				if the location is the room gone to:
					let the room back the other way be the room back way from
					the location;
					let the room normally this way be the room noun from the
					room gone from;
					if the room back the other way is the room gone from or the
					room back the other way is the room normally this way:
						if the back way is up:
							say "[arrive] from above" (D);
						otherwise if the back way is down:
							say "[arrive] from below" (E);
						otherwise:
							say "[arrive] from [the back way]" (F);
					otherwise:
						say "[arrive]" (G);
				otherwise:
					if the back way is up:
						say "[arrive] at [the room gone to] from above" (H);
					otherwise if the back way is down:
						say "[arrive] at [the room gone to] from below" (I);
					otherwise:
						say "[arrive] at [the room gone to] from [the back way]"
						(J);
		otherwise if the location is the room gone from:
			say "[go] through [the noun]" (K);
		otherwise:
			say "[arrive] from [the noun]" (L);
		if the vehicle gone by is not nothing:
			if the vehicle gone by is a supporter:
				say " on [the vehicle gone by]" (M);
			otherwise:
				say " in [the vehicle gone by]" (N);
		if the thing gone with is not nothing:
			if the player is within the thing gone with:
				say ", pushing [the thing gone with] in front, and [us] along
				too" (O);
			otherwise if the player is within the vehicle gone by:
				say ", pushing [the thing gone with] in front" (P);
			otherwise if the location is the room gone from:
				say ", pushing [the thing gone with] away" (Q);
			otherwise:
				say ", pushing [the thing gone with] in" (R);
		if the player is within the vehicle gone by and the player is not
			within the thing gone with:
			say ", taking [us] along." (S);
			try looking;
			continue the action;
		say "." (T);
		stop the action.

Chapter 5 - Implicit passing through barriers

The entering action has a truth state called implicitly passing through barriers
before entering. The better implicitly pass through other barriers rule is
listed instead of the implicitly pass through other barriers rule in the check
entering rulebook. This is the better implicitly pass through other barriers
rule:
	if the holder of the actor is the holder of the noun:
		continue the action;
	now implicitly passing through barriers before entering is true;
	let the local ceiling be the common ancestor of the actor with the noun;
	let first item be true;
	let at least two items be false;
	while the holder of the actor is not the local ceiling:
		let the current home be the holder of the actor;
		silently try the actor trying exiting;
		if the holder of the actor is the current home:
			stop the action;
		if the action is not silent:
			if the current home is a supporter or the current home is an animal:
				if first item is true:
					if the actor is the player:
						say "[We] [get] off [the current home][run paragraph
						on]" (A);
					otherwise:
						say "[The actor] [get] off [the current home][run
						paragraph on]" (B);
					now first item is false;
				otherwise:
					say ", off [the current home][run paragraph on]" (C);
					now at least two items is true;
			otherwise:
				if first item is true:
					if the actor is the player:
						say "[We] [get] out of [the current home][run paragraph
						on]" (D);
					otherwise:
						say "[The actor] [get] out of [the current home][run
						paragraph on]" (E);
					now first item is false;
				otherwise:
					say ", out of [the current home][run paragraph on]" (F);
					now at least two items is true;
	if the holder of the actor is the noun:
		stop the action;
	if the holder of the actor is not the holder of the noun:
		let the target be the holder of the noun;
		if the noun is part of the target:
			let the target be the holder of the target;
		while the target is a thing:
			if the holder of the target is the local ceiling:
				silently try the actor trying entering the target;
				if the holder of the actor is not the target:
					stop the action;
				if the action is not silent:
					if the target is a supporter:
						if first item is true:
							if the actor is the player:
								say "[We] [get] onto [the target][run paragraph
								on]" (G);
							otherwise:
								say "[The actor] [get] onto [the target][run
								paragraph on]" (H);
							now first item is false;
						otherwise:
							say ", onto [the target][run paragraph on]" (I);
							now at least two items is true;
					otherwise if the target is a container:
						if first item is true:
							if the actor is the player:
								say "[We] [get] into [the target][run paragraph
								on]" (J);
							otherwise:
								say "[The actor] [get] into [the target][run
								paragraph on]" (K);
							now first item is false;
						otherwise:
							say ", into [the target][run paragraph on]" (L);
							now at least two items is true;
					otherwise:
						if first item is true:
							if the actor is the player:
								say "[We] [enter] [the target][run paragraph
								on]" (M);
							otherwise:
								say "[The actor] [enter] [the target][run
								paragraph on]" (N);
							now first item is false;
						otherwise:
							say ", [the target][run paragraph on]" (O);
							now at least two items is true;
				break;
			let the target be the holder of the target;
	say "[if serial comma option is active and at least two items is true],[end
	if] and [run paragraph on]" (P);

The implicit passing through barriers before entering rule is listed before the
standard report entering rule in the report entering rulebook. Report an actor
entering (this is the implicit passing through barriers before entering rule):
	if implicitly passing through barriers before entering is true:
		if the action is not silent:
			if the noun is a container:
				say "into [the noun]." (A);
			otherwise:
				say "onto [the noun]." (B);
		stop the action.

Better Implicit Actions ends here.

---- DOCUMENTATION ----

This extension provides alternate responses when some implicit actions occur.
Implicit action responses will now only be printed if the implicit action
succeeds. Additionally, this extension attempts to combine implicit actions with
their corresponding action into complete, single sentences.
