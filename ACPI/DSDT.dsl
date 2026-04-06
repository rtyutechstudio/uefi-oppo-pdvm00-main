DefinitionBlock ("", "DSDT", 2, "RAIN", "BENGAL", 0x00000002)
{
    Scope (_SB)
    {
        /*
         * SoC root
         */
        Device (SOC0)
        {
            Name (_HID, "ACPI0016")
            Name (_UID, 0)
            Name (_STA, 0x0F)
        }

        /*
         * PSCI placeholder
         * DTS CPUs use enable-method = "psci".
         */
        Device (PSCI)
        {
            Name (_HID, "ARMH0011")
            Name (_UID, 0)
            Name (_STA, 0x0F)
        }

        /*
         * GICv3
         * DTS:
         * interrupt-controller@f200000
         * reg = <0xf200000 0x10000 0xf300000 0x100000>
         */
        Device (GIC0)
        {
            Name (_HID, "ARMH0061")
            Name (_UID, 0)
            Name (_STA, 0x0F)

            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite, 0x0F200000, 0x00010000)
                Memory32Fixed (ReadWrite, 0x0F300000, 0x00100000)
            })
        }

        /*
         * Main debug UART candidate
         * DTS:
         * qcom,qup_uart@4a90000
         * compatible = "qcom,msm-geni-console"
         * reg = <0x4a90000 0x4000>
         * interrupts = <0x00 0x14b 0x04>
         */
        Device (URT0)
        {
            Name (_HID, "QCOM0001")
            Name (_UID, 0)
            Name (_CCA, 1)
            Name (_STA, 0x0F)

            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite, 0x04A90000, 0x00004000)

                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive)
                {
                    0x14B
                }
            })
        }

        /*
         * Secondary UART candidate
         * DTS:
         * qcom,qup_uart@4a8c000
         * compatible = "qcom,msm-geni-serial-hs"
         * reg = <0x4a8c000 0x4000>
         * interrupts-extended includes GIC 0x14a
         */
        Device (URT1)
        {
            Name (_HID, "QCOM0002")
            Name (_UID, 1)
            Name (_CCA, 1)
            Name (_STA, 0x0F)

            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite, 0x04A8C000, 0x00004000)

                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive)
                {
                    0x14A
                }
            })
        }

        /*
         * UFS controller
         * DTS:
         * ufshc@4804000
         * reg = <0x4804000 0x3000 0x4810000 0x8000>
         * interrupts = <0x00 0x164 0x04>
         */
        Device (UFS0)
        {
            Name (_HID, "QCOM24A5")
            Name (_UID, 0)
            Name (_CCA, 1)
            Name (_STA, 0x0F)

            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite, 0x04804000, 0x00003000)
                Memory32Fixed (ReadWrite, 0x04810000, 0x00008000)

                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive)
                {
                    0x164
                }
            })
        }

        /*
         * SDHCI 1
         * DTS:
         * sdhci@4744000
         * reg = <0x4744000 0x1000 0x4745000 0x1000 0x4748000 0x8000>
         * primary irq = 0x15c
         */
        Device (SDC1)
        {
            Name (_HID, "QCOM242E")
            Name (_UID, 1)
            Name (_CCA, 1)
            Name (_STA, 0x0F)

            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite, 0x04744000, 0x00001000)
                Memory32Fixed (ReadWrite, 0x04745000, 0x00001000)
                Memory32Fixed (ReadWrite, 0x04748000, 0x00008000)

                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive)
                {
                    0x15C
                }
            })
        }

        /*
         * SDHCI 2
         * DTS:
         * sdhci@4784000
         * reg = <0x4784000 0x1000>
         * primary irq = 0x15e
         */
        Device (SDC2)
        {
            Name (_HID, "QCOM242E")
            Name (_UID, 2)
            Name (_CCA, 1)
            Name (_STA, 0x0F)

            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite, 0x04784000, 0x00001000)

                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive)
                {
                    0x15E
                }
            })
        }

        /*
         * RPM SMD block placeholder
         * DTS node exists, irq = 0xC2
         */
        Device (RPMB)
        {
            Name (_HID, "QCOM0100")
            Name (_UID, 0)
            Name (_STA, 0x0F)

            Name (_CRS, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive)
                {
                    0x0C2
                }
            })
        }

        /*
         * Watchdog placeholder
         * DTS: qcom,wdt@f017000
         */
        Device (WDT0)
        {
            Name (_HID, "QCOM0200")
            Name (_UID, 0)
            Name (_STA, 0x0F)

            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite, 0x0F017000, 0x00001000)

                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive)
                {
                    0x003
                }

                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive)
                {
                    0x004
                }
            })
        }

        /*
         * Generic placeholder for system memory container.
         * Your DTS memory node does not expose usable RAM layout here.
         */
        Device (MEM0)
        {
            Name (_HID, "PNP0C01")
            Name (_UID, 0)
            Name (_STA, 0x0F)
        }

        /*
         * Timer placeholder only.
         * Real ARM boot needs GTDT outside DSDT.
         */
        Device (TIMR)
        {
            Name (_HID, "ARMH001F")
            Name (_UID, 0)
            Name (_STA, 0x0F)
        }
    }
}