## What it does

`cte` (Clear Technical English) shapes how the [agent](https://www.aihero.dev/ai-coding-dictionary/agent) writes an explanation, so you understand it on the first pass.
It does not trade accuracy for brevity.
An explanation gets longer when a detail is needed to keep it correct, and an uncertain detail is stated as unknown, together with what would verify it.

## When to reach for it

Type `/cte`, or the agent reaches for it automatically when a task fits.

| Situation | What to do |
| --- | --- |
| The agent is about to explain a technical idea | Nothing: the agent loads `cte` on its own |
| An explanation is confusing, jargon-heavy, or vague | Type `/cte` and ask for it again |
| A message lost you, and you need the missing context and your project's vocabulary | Use [wait-what](https://aihero.dev/skills-wait-what) instead |

## The reader understands on the first pass

The leading idea is the **first pass**.
Every rule in the skill removes one reason a reader would have to read twice:

- One main idea per sentence.
- A technical term is kept when it is the correct term, and defined the first time it appears.
- An acronym is expanded the first time it appears.
- Each action names its actor: the component that performs it.
- Steps appear in the order they happen.
- Confirmed behaviour, assumptions, and recommendations stay separate.

Before it finishes, the agent checks that every pronoun has a clear referent and that each step says what changes and why.

## Common questions

**How is this different from `wait-what`?**
`wait-what` repairs a message after it failed to land, and you have to fire it by hand.
`cte` works upfront: the agent applies it while it writes the explanation, so fewer messages need repair.

**Does it make the agent write in ASD-STE100 Simplified Technical English?**
No.
It follows the general goals of clear technical writing, but it does not certify formal ASD-STE100 compliance.

## It's working if

- You understand an explanation without reading it twice.
- Each acronym and unfamiliar term is defined the first time it appears.
- You can tell which statements the agent confirmed and which it assumes.
- Explanations stay accurate: the agent says what it does not know instead of dropping the detail.

## Where it fits

`cte` is a reach-for-it-anytime standalone.
Its nearest neighbour is [wait-what](https://aihero.dev/skills-wait-what), because that skill repairs the explanations `cte` did not prevent.
When you're unsure which skill fits a moment, [ask-matt](https://aihero.dev/skills-ask-matt) routes you over the whole set.
