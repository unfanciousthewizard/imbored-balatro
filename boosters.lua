
SMODS.Booster {
    key = 'crackheads_pokemon_cards',
    loc_txt = {
        name = "crackhead's pokemon cards",
        text = {
            [1] = 'the guy at the dumpster gave me this'
        },
        group_name = "imbored_boosters"
    },
    config = { extra = 3, choose = 1 },
    cost = 6,
    weight = 5,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    group_key = "imbored_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "imbored_imbored_jokers",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "imbored_crackheads_pokemon_cards"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("bd10e0"))
        ease_background_colour({ new_colour = HEX('bd10e0'), special_colour = HEX("9013fe"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
    
    
    SMODS.Booster {
        key = 'what',
        loc_txt = {
            name = "?",
            text = {
                [1] = 'It feels empty?'
            },
            group_name = "imbored_boosters"
        },
        config = { extra = 3, choose = 1 },
        cost = 1,
        weight = 9,
        atlas = "CustomBoosters",
        pos = { x = 1, y = 0 },
        group_key = "imbored_boosters",
        discovered = true,
        loc_vars = function(self, info_queue, card)
            local cfg = (card and card.ability) or self.config
            return {
                vars = { cfg.choose, cfg.extra }
            }
        end,
        create_card = function(self, card, i)
            return {
                set = "Joker",
                rarity = "imbored_useless",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "imbored_what"
            }
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("494343"))
            ease_background_colour({ new_colour = HEX('494343'), special_colour = HEX("272323"), contrast = 2 })
        end,
        particles = function(self)
            -- No particles for joker packs
            end,
        }
        