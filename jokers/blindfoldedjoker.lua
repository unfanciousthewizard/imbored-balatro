
SMODS.Joker{ --Blindfolded Joker
    key = "blindfoldedjoker",
    config = {
        extra = {
            blind_size0 = 0.9
        }
    },
    loc_txt = {
        ['name'] = 'Blindfolded Joker',
        ['text'] = {
            [1] = 'When {C:blue}Blind{} is {C:red}skipped{},',
            [2] = '{X:black,C:red}X0.9{} Blind Requirement'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
    pools = { ["imbored_imbored_jokers"] = true, ["imbored_suggestive"] = true },
    
    calculate = function(self, card, context)
        if context.skip_blind  then
            return {
                
                func = function()
                    if G.GAME.blind.in_blind then
                        
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(0.9).." Blind Size", colour = G.C.GREEN})
                        G.GAME.blind.chips = G.GAME.blind.chips * 0.9
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        G.HUD_blind:recalculate()
                        return true
                    end
                end
            }
        end
    end
}