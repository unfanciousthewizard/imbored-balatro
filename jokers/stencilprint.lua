
SMODS.Joker{ --Stencilprint
    key = "stencilprint",
    config = {
        extra = {
            JokerCountSHIT = 1,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Stencilprint',
        ['text'] = {
            [1] = '{C:green}1/4{} Chance to',
            [2] = '{C:green}Clone{} {C:attention}Joker{} to the Right,',
            [3] = 'When {C:purple}Blind{} is Selected,',
            [4] = '{C:red}Destroys{} Self Afterward.'
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
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["imbored_imbored_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_imbored_stencilprint') 
        return {vars = {card.ability.extra.JokerCountSHIT, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_8389747b', 1, card.ability.extra.odds, 'j_imbored_stencilprint', false) then
                    SMODS.calculate_effect({func = function()
                        local my_pos = nil
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i] == card then
                                my_pos = i
                                break
                            end
                        end
                        local target_joker = (my_pos and my_pos < #G.jokers.cards) and G.jokers.cards[my_pos + 1] or nil
                        
                        if target_joker then
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                                    
                                    copied_joker:add_to_deck()
                                    G.jokers:emplace(copied_joker)
                                    G.GAME.joker_buffer = 0
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex'), colour = G.C.GREEN})
                        end
                        return true
                    end}, card)
                    SMODS.calculate_effect({func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}