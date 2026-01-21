
SMODS.Joker{ --Transparint
    key = "transparint",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Transparint',
        ['text'] = {
            [1] = '{C:green}1/10{} chance to {C:green}copy{} {C:attention}joker{} to the right'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["imbored_imbored_jokers"] = true }
}