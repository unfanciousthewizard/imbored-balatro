
SMODS.Voucher {
    key = 'fuck_that_cloud',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            all_blinds_size0 = 2,
            winner_ante_value0 = 16
        } 
    },
    loc_txt = {
        name = 'fuck that cloud',
        text = {
            [1] = '',
            [2] = '{s:5}i hate that cloud{}'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling / 2
                return true
            end
        }))
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + 15
                    G.GAME.current_round.reroll_cost = math.max(0,
                    G.GAME.current_round.reroll_cost + 15)
                    return true
                end
            }))
            ,
            extra = {
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.discount_percent = (G.GAME.discount_percent or 0)
                        for v in pairs(G.I.CARD) do
                        if v.set_cost then v:set_cost() end
                            return true
                        end
                    end
                }))
                ,
                colour = G.C.BLUE,
                extra = {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.win_ante = 16
                                return true
                            end
                        }))
                        return true
                    end,
                    message = "Winner Ante set to " .. 16 .. "!",
                    colour = G.C.FILTER
                }
            }
        }
    end
}