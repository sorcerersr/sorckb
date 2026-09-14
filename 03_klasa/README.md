# Klasa

The "Klasa" is a 36-key, columnar-staggered split keyboard.
After using ortholinear and some columnar-staggered keyboards for a while, I wanted a keyboard somewhere in between: not fully ortho, yet also not as steeply columnar-staggered as most columnar-staggered boards.

## Design-Goals

* handwired
* uses Gateron KS-33 low-profile switches
* 36 keys (with [https://onedeadkey.github.io/selenium/](https://onedeadkey.github.io/selenium/) in mind)
* wired with usb-c interconnect
* use a partial column stagger: keys are still column-staggered, just with a smaller offset than common columnar-staggered keyboards
* make use of self tapping screws (no heated inserts) and screwed together from the bottom
* compact and portable (to use on the go)

## Non-Design-Goals

* no tilting or tenting built into the case - maybe realized in the future through accessories like a stand. Keeping it out of the case makes printing and assembly easier and keeps the keyboard compact
* not as flat as possible - a flat keyboard would be nice but not at all costs, hence the choice of Gateron KS-33 switches and full MX switch compatibility

## Bill of Materials

| Item | Description | Quantity | Comment/Image |
|:--- |:--- |:--- |:--- |
| **Switches** | Gateron KS-33 Switches or MX Switches | 36 |  |
| **Controller** | Pro Micro | 2 | ![Image of a Pro Micro MCU](./images/promicro.png) |
| **Diodes** | 1N4148 Diodes | 36 | |  
| **Hardware** | M2 6mm self tapping screws | 28 | ![Image of a M2x6 self tapping screw](./images/screw.png)  |
| **Breakout Board** | USB-C Breakout Board | 2 | ![Image of a USB-C Breakout Board](./images/usb_breakout.png) |
| **Misc** | wire (Solid core recommended) | - | |
| **Optional** | Rubber feet | - | |


## Wiring

![Wiring diagram](./images/wiring.png)


Real wiring of the left half:


![Wiring of the left half](./images/wiring_left_half.png)



## Firmware

Firmware (QMK) is located here: [https://github.com/sorcerersr/qmk_firmware/tree/klasa/keyboards/klasa](https://github.com/sorcerersr/qmk_firmware/tree/klasa/keyboards/klasa)


## Assembled Keyboard

Left half assembled using Gateron KS-33 Chocolate switches but without keycaps:


![Left half assembled without keycaps](./images/assembled_left_half_without_keycaps.png)

## MX Switches

The case was designed with the intention to mainly use Gateron KS-33 switches but regular MX sized switches fit as well although there is not much space left.


![Left case with some MX switches](./images/case_with_mx_switches.png)


![Not much space left when using MX switches](./images/case_with_mx_switches_fit.png)
