## What it does

`humanizer` rewrites text that sounds AI-written so it reads like the person who wrote it.
It keeps every claim the text makes and adds none: no new fact, name, number, date, quote, or citation unless it comes from the source or from you.
A sentence that needs a missing detail gets simpler, or the [agent](https://www.aihero.dev/ai-coding-dictionary/agent) asks you for the detail.

## When to reach for it

You invoke this by typing `/humanizer`, and the agent won't reach for it on its own.

| Situation | What to do |
| --- | --- |
| A finished draft (a blog post, a PR body, a message) sounds like a chatbot wrote it | Type `/humanizer` and paste the text |
| A file holds the prose you want cleaned up | Type `/humanizer` and name the file: only the prose changes, code and links stay as they are |
| You want it to sound like you specifically | Paste a sample of your own writing along with the text |
| The agent is about to explain something and you want it clear on the first pass | Use [cte](https://aihero.dev/skills-cte) instead |

## Tells, strongest first

The leading word is the **tell**: a pattern a careful writer rarely makes on purpose, so it gives the text away as AI-written.
The skill lists 26 of them, taken from Wikipedia's guide to the signs of AI writing, grouped by where they come from:

- **Staging**: a sentence that signals importance instead of adding a fact ("It's not just X, it's Y", "That is the real win.").
- **Rhythm by rule**: groups of three and dashes used everywhere, whether the meaning asks for them or not.
- **Inflation**: ordinary facts dressed as pivotal, as a lasting legacy, or as backed by unnamed experts.
- **Formatting by rule**: a bold label on every list item, Title Case headings, emojis.
- **Leftovers**: "I hope this helps!", training-cutoff disclaimers, a heading repeated in the first sentence.
- **Wrong reader**: a reply that re-explains background the reader already has, so the decision arrives last.

The tells are ranked.
The strongest justify an edit on one sighting; the weak ones only count when other tells sit in the same passage.

## Common questions

**Will the rewrite get past AI detectors such as Turnitin or Pangram?**
Not reliably, and it is not built to.
A blind test found readers preferred the rewrites, but detector scores did not move.
The goal is text a person enjoys reading, not text a classifier passes.

**Will it change what my text says?**
It should not.
After drafting, the agent checks whether the rewrite added or dropped any fact, number, ranking, or claim, and treats either as an error.
Cutting groups of three and bold labels is where facts most often slip out, so check those spots in the result.

**Why does it remove every dash?**
A dash lets the writer skip deciding how two clauses relate, so models use them everywhere.
If your writing sample uses dashes, the rewrite keeps them at about the same rate.

## It's working if

- The rewrite reads like a person wrote it, and you can't find a "not X but Y" or a one-line closer in it.
- Every fact, number, and name from your original is still there, and nothing new appeared.
- Given a sample of your writing, the result sounds like you rather than like a neutral editor.

## Where it fits

`humanizer` is a reach-for-it-anytime standalone, used on a finished draft.
Its nearest neighbour is [cte](https://aihero.dev/skills-cte), because `cte` shapes an explanation while it is written, and `humanizer` edits prose that already exists.
When you're unsure which skill fits a moment, [ask-matt](https://aihero.dev/skills-ask-matt) routes you over the whole set.
