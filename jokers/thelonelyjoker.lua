
SMODS.Joker{ --The Lonely Joker
    key = "thelonelyjoker",
    config = {
        extra = {
            jokercount = 0,
            chips0 = 20,
            mult0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'The Lonely Joker',
        ['text'] = {
            [1] = 'When {C:red}alone{},',
            [2] = '{C:blue}+20{} Chips and {C:red}+10{} Mult',
            [3] = 'When {C:green}not alone{},',
            [4] = '{C:green}Multiply{} those by',
            [5] = 'The number of',
            [6] = '{C:attention}Jokers{} in hand.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
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
        
        return {vars = {(#(G.jokers and (G.jokers and G.jokers.cards or {}) or {})) * 20}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(#G.jokers.cards) == to_big(1) then
                return {
                    chips = 20,
                    extra = {
                        mult = 10
                    }
                }
            elseif to_big(#G.jokers.cards) > to_big(1) then
                return {
                    chips = (#(G.jokers and G.jokers.cards or {})) * 20,
                    extra = {
                        mult = (#(G.jokers and G.jokers.cards or {})) * 10
                    }
                }
            end
        end
    end
}