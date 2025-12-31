
SMODS.Shader({ key = 'greyscale', path = 'greyscale.fs' })

SMODS.Edition {
    key = 'evil',
    shader = 'greyscale',
    in_shop = false,
    weight = 3.5,
    extra_cost = 5,
    apply_to_float = false,
    badge_colour = HEX('FF0000'),
    sound = { sound = "gong", per = 1.2, vol = 0.4 },
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'evil',
        label = 'evil',
        text = {
            [1] = 'supa {C:red}evil{} no good'
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            assert(SMODS.change_base(card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
            return {
                message = "yah.....im evil"
            }
        end
        if context.cardarea == G.hand and context.main_scoring then
            return {
                func = function()
                    assert(SMODS.change_base(card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                end,
                message = "yah.....im evil"
            }
        end
        if context.discard and context.other_card == card then
            return {
                func = function()
                    assert(SMODS.change_base(context.other_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                end,
                message = "yah.....im evil"
            }
        end
    end
}