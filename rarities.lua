SMODS.Rarity {
    key = "useless",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.1,
    badge_colour = HEX('636363'),
    loc_txt = {
        name = "boring"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "pure_and_good",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.04,
    badge_colour = HEX('7ed321'),
    loc_txt = {
        name = "pure and good"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "evil_and_dastardly",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.04,
    badge_colour = HEX('d0021b'),
    loc_txt = {
        name = "evil and dastardly"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "meme",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.08,
    badge_colour = HEX('9013fe'),
    loc_txt = {
        name = "meme"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "creation_of_madness",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('350000'),
    loc_txt = {
        name = "CREATION OF MADNESS"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}