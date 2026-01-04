
SMODS.Joker{ --PAC MAN?!
    key = "pacman",
    config = {
        extra = {
            MultNumber = 1
        }
    },
    loc_txt = {
        ['name'] = 'PAC MAN?!',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult',
            [2] = 'Upon playing a hand,',
            [3] = '{C:red}Destroy{} joker to the right,',
            [4] = 'Increment {X:red,C:white}XMult{} by 0.25'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
        
        return {vars = {card.ability.extra.MultNumber}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(#G.jokers.cards) > to_big(1) then
                local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end
                end
                local target_joker = nil
                if my_pos and my_pos < #G.jokers.cards then
                    local joker = G.jokers.cards[my_pos + 1]
                    if not SMODS.is_eternal(joker) and not joker.getting_sliced then
                        target_joker = joker
                    end
                end
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:explode({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                card.ability.extra.MultNumber = (card.ability.extra.MultNumber) + 0.25
                return {
                    Xmult = card.ability.extra.MultNumber
                }
            end
        end
    end
}