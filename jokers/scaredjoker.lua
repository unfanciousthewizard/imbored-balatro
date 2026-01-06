
SMODS.Joker{ --Scared Joker
    key = "scaredjoker",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Scared Joker',
        ['text'] = {
            [1] = 'If another Joker triggers,',
            [2] = '{C:red}self destructs{}.',
            [3] = 'Otherwise, {X:red,C:white}X1.5{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["imbored_imbored_jokers"] = true }
}