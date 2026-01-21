
SMODS.Joker{ --Stencilprint
    key = "stencilprint",
    config = {
        extra = {
            JokerCountSHIT = 1
        }
    },
    loc_txt = {
        ['name'] = 'Stencilprint',
        ['text'] = {
            [1] = '{C:green}3/6{} chance to {C:green}copy{} {C:attention}joker{} to the right'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["imbored_imbored_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.JokerCountSHIT}}
    end
}