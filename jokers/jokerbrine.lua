
SMODS.Joker{ --JokerBrine
    key = "jokerbrine",
    config = {
        extra = {
            blind_size0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'JokerBrine',
        ['text'] = {
            [1] = '...'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
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
    pools = { ["imbored_imbored_jokers"] = true },
    soul_pos = {
        x = 9,
        y = 2
    },
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("imbored_ominous")
                    
                    return true
                end,
            }))
        end
        if context.selling_self  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("imbored_ominous")
                    
                    return true
                end,
            }))
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                
                func = function()
                    if G.GAME.blind.in_blind then
                        
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Only god can help you now.", colour = G.C.GREEN})
                        G.GAME.blind.chips = G.GAME.blind.chips * 10
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        G.HUD_blind:recalculate()
                        return true
                    end
                end
            }
        end
    end
}