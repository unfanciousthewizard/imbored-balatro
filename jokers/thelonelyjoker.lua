
SMODS.Joker{ --The Lonely Joker
    key = "thelonelyjoker",
    config = {
        extra = {
            checkchips = 20,
            checkmult = 10,
            jokercount = 0,
            chips0 = 20,
            mult0 = 10,
            repetitions = 5
        }
    },
    loc_txt = {
        ['name'] = 'The Lonely Joker',
        ['text'] = {
            [1] = '{C:blue}+#2#{} Chips and {C:red}+#3#{} Mult',
            [2] = '{C:green}Multiply{} those by',
            [3] = 'The number of',
            [4] = '{C:attention}Jokers{} in hand.'
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
        
        return {vars = {card.ability.extra.checkchips, card.ability.extra.checkmult, (#(G.jokers and (G.jokers and G.jokers.cards or {}) or {})) * 20}}
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
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            if true then
                for i = 1, 5 do
                    SMODS.calculate_effect({func = function()
                        card.ability.extra.checkmult = (#(G.jokers and G.jokers.cards or {})) * 10
                        return true
                    end}, card)
                end
                for i = 1, 5 do
                    SMODS.calculate_effect({func = function()
                        card.ability.extra.checkchips = (#(G.jokers and G.jokers.cards or {})) * 20
                        return true
                    end}, card)
                end
            end
        end
    end
}