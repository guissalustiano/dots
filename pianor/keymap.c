#include QMK_KEYBOARD_H

enum layer_names {
    _BaseL,
    _NavL,
    _NumL,
    _SymL,
    _FunL,
    _ZroL,
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [_BaseL] = LAYOUT_split_3x6_3(
        KC_NO,   KC_Q,         KC_W,            KC_F,            KC_P,              KC_B,                                                             KC_J,             KC_L,            KC_U,            KC_Y,            KC_QUOT,         KC_NO,
        KC_NO,   LGUI_T(KC_A), LALT_T(KC_R),    LCTL_T(KC_S),    LSFT_T(KC_T),      KC_G,                                                             KC_M,             RSFT_T(KC_N),    LCTL_T(KC_E),    LALT_T(KC_I),    LGUI_T(KC_O),    LGUI_T(KC_O),
        KC_NO,   KC_Z,         KC_X,            KC_C,            KC_D,              KC_V,                                                             KC_K,             KC_H,            KC_COMM,         KC_DOT,          KC_SLSH,         KC_NO,
                                                                 LT(_ZroL, KC_ESC), LT(_NavL, KC_SPC), LT(_ZroL, KC_TAB),         LT(_SymL, KC_ENT),  LT(_NumL, KC_BSPC), LT(_FunL, KC_DEL)
    ),
    [_NavL] = LAYOUT_split_3x6_3(
        KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
        KC_NO,   KC_LGUI, KC_LALT, KC_LCTL, KC_LSFT, KC_NO,                              KC_NO,   KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, KC_RGHT,
        KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
	                                          KC_NO,   KC_NO,   KC_NO,            KC_ENT,  KC_BSPC, KC_DEL
    ),
    [_NumL] = LAYOUT_split_3x6_3(
        KC_NO,   KC_LBRC, KC_7,    KC_8,    KC_9,    KC_RBRC,                            KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
        KC_NO,   KC_SCLN, KC_4,    KC_5,    KC_6,    KC_EQL,                             KC_NO,   KC_RSFT, KC_RCTL, KC_RALT, KC_RGUI, KC_RGUI,
        KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
                                            KC_DOT,  KC_0,    KC_MINS,          KC_NO,   KC_NO,   KC_NO,
    ),
    [_SymL] = LAYOUT_split_3x6_3(
        KC_NO,   KC_LCBR, KC_AMPR, KC_ASTR, KC_LPRN, KC_RCBR,                            KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
        KC_NO,   KC_COLN, KC_DLR, KC_PERC, KC_CIRC, KC_PLUS,                             KC_NO,   KC_RSFT, KC_RCTL, KC_RALT, KC_RGUI, KC_RGUI,
        KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
                                            KC_DOT,  KC_0,    KC_MINS,          KC_NO,   KC_NO,   KC_NO,
    ),
    [_FunL] = LAYOUT_split_3x6_3(
        KC_NO,   KC_F12,  KC_F7,   KC_F8,   KC_F9,   KC_NO,                              KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
        KC_NO,   KC_F11,  KC_F4,   KC_F5,   KC_F6,   KC_NO,                              KC_NO,   KC_RSFT, KC_RCTL, KC_RALT, KC_RGUI, KC_RGUI,
        KC_NO,   KC_F10,  KC_F1,   KC_F2,   KC_F3,   KC_NO,                              KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
                                            KC_ESC,  KC_SPC, KC_TAB,            KC_NO,   KC_NO,   KC_NO,
    ),
    [_ZroL] = LAYOUT_split_3x6_3(
        KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO, , KC_NO,
        KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
        KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,   KC_NO,   KC_NO, , KC_NO,   KC_NO, , KC_NO,
	                                          KC_NO,   KC_NO,   KC_NO,            KC_NO,   KC_NO,   KC_NO
    ),
};
