Asterix expansion 021 - ADS-B Target Reports Expansion
======================================================
**category**: 021

**edition**: 1.4

**date**: 2018-03-08


Description of asterix expansion
--------------------------------
Compound item (fspec=8 bits)

    **BPS** - *Barometric Pressure Setting*

        ``(spare)``

        - 4 bits [``....``]

        **BPS** - *Barometric Pressure Setting*

        - 12 bits [``............``]

        - unsigned quantity
        - scaling factor: 0.1
        - fractional bits: 0
        - unit: "hPa"
        - LSB = :math:`0.1` hPa
        - value :math:`>= 0` hPa
        - value :math:`<= 409.5` hPa

        remark
            Notes:

                - BPS is the barometric pressure setting of the aircraft minus 800 hPa

                - A value of "0" indicates that in the aircraft a value of 800 hPa or
                  less has been selected.

                - A value of "409.5" indicates that in the aircraft a value of 1209.5
                  hPa or more has been selected.

    **SelH** - *Selected Heading*

        ``(spare)``

        - 4 bits [``....``]

        **HDR** - *Horizontal Reference Direction*

        - 1 bit [``.``]

        - values:

            | 0: True North
            | 1: Magnetic North

        **Stat** - *Selected Heading Status*

        - 1 bit [``.``]

        - values:

            | 0: Data is either unavailable or invalid.
            | 1: Data is available and valid.

        **SelH** - *Selected Heading*

        - 10 bits [``..........``]

        - unsigned quantity
        - scaling factor: 45
        - fractional bits: 6
        - unit: "deg"
        - LSB = :math:`45 / {2^{6}}` deg = :math:`45 / {64}` deg :math:`\approx 0.703125` deg

        remark
            On many aircraft, the ADS-B Transmitting Subsystem receives
            Selected Heading from a Mode Control Panel / Flight Control Unit
            (MCP / FCU). Users of this data are cautioned that the Selected
            Heading value transmitted by the ADS-B Transmitting Subsystem
            does not necessarily reflect the true intention of the airplane during
            certain flight modes (e.g., during LNAV mode).

    **NAV** - *Navigation Mode*

        **AP** - *Autopilot*

        - 1 bit [``.``]

        - values:

            | 0: Autopilot not engaged
            | 1: Autopilot engaged

        **VN** - *Vertical Navigation*

        - 1 bit [``.``]

        - values:

            | 0: Vertical Navigation not active
            | 1: Vertical Navigation active

        **AH** - *Altitude Hold*

        - 1 bit [``.``]

        - values:

            | 0: Altitude Hold not engaged
            | 1: Altitude Hold engaged

        **AM** - *Approach Mode*

        - 1 bit [``.``]

        - values:

            | 0: Approach Mode not active
            | 1: Approach Mode active

        ``(spare)``

        - 4 bits [``....``]

        remark
            This data-item should only be transmitted if an ADS-B indication has
            been received that the mode bits have been "actively populated".by
            the avionics (1090 ES version 2 (as defined in I021/210) BDS 6,2,
            subtype 1, bit 47: "Status of MCP / FCU Mode Bits")

    **GAO** - *GPS Antenna Offset*

    - 8 bits [``........``]

    - raw value

        remark
            The value of this field is copied from the respective bits 33-40 of
            version 2 (as defined in I021/210) of 1090 ES BDS register 6,5
            (Aircraft Operational Status)

    **SGV** - *Surface Ground Vector*

    Extended item with first part ``16 bits`` long and optional ``8 bits`` extends.

        **STP**

        - 1 bit [``.``]

        - values:

            | 0: Aircraft has not stopped
            | 1: Aircraft has stopped

        **HTS**

        - 1 bit [``.``]

        - values:

            | 0: Heading/Ground Track data is not valid
            | 1: Heading/Ground Track data is valid

        **HTT**

        - 1 bit [``.``]

        - values:

            | 0: Heading data provided
            | 1: Ground Track provided

        **HRD**

        - 1 bit [``.``]

        - values:

            | 0: True North
            | 1: Magnetic North

        **GSS** - *Ground speed*

        - 11 bits [``...........``]

        - unsigned quantity
        - scaling factor: 1
        - fractional bits: 3
        - unit: "kts"
        - LSB = :math:`1 / {2^{3}}` kts = :math:`1 / {8}` kts :math:`\approx 0.125` kts

        ``(FX)``

        - extension bit

            | 0: End of data item
            | 1: Extension into next extent

        **HGT** - *Heading/Ground Track information*

        - 7 bits [``.......``]

        - unsigned quantity
        - scaling factor: 45
        - fractional bits: 4
        - unit: "deg"
        - LSB = :math:`45 / {2^{4}}` deg = :math:`45 / {16}` deg :math:`\approx 2.8125` deg

        ``(FX)``

        - extension bit

            | 0: End of data item
            | 1: Extension into next extent

    **STA** - *Aircraft Status*

    Extended item with first part ``8 bits`` long and optional ``8 bits`` extends.

        **ES**

        - 1 bit [``.``]

        - values:

            | 0: Target is not 1090 ES IN capable
            | 1: Target is 1090 ES IN capable

        **UAT**

        - 1 bit [``.``]

        - values:

            | 0: Target is not UAT IN capable
            | 1: Target is UAT IN capable

        ``(spare)``

        - 5 bits [``.....``]

        ``(FX)``

        - extension bit

            | 0: End of data item
            | 1: Extension into next extent

    **TNH** - *True North Heading*

    - 16 bits [``................``]

    - unsigned quantity
    - scaling factor: 360
    - fractional bits: 16
    - unit: "deg"
    - LSB = :math:`360 / {2^{16}}` deg = :math:`360 / {65536}` deg :math:`\approx 0.0054931640625` deg

        remark
            Magnetic Heading is defined in I021/152.

    **MES** - *Military Extended Squitter*

    Compound item (FX)

        **SUM** - *Mode 5 Summary*

            **M5**

            - 1 bit [``.``]

            - values:

                | 0: No Mode 5 interrogation
                | 1: Mode 5 interrogation

            **ID**

            - 1 bit [``.``]

            - values:

                | 0: No authenticated Mode 5 ID reply/report
                | 1: Authenticated Mode 5 ID reply/report

            **DA**

            - 1 bit [``.``]

            - values:

                | 0: No authenticated Mode 5 Data reply or Report
                | 1: Authenticated Mode 5 Data reply or Report (i.e any valid Mode 5 reply type other than ID)

            **M1**

            - 1 bit [``.``]

            - values:

                | 0: Mode 1 code not present or not from Mode 5 reply/report
                | 1: Mode 1 code from Mode 5 reply/report.

            **M2**

            - 1 bit [``.``]

            - values:

                | 0: Mode 2 code not present or not from Mode 5 reply/report
                | 1: Mode 2 code from Mode 5 reply/report.

            **M3**

            - 1 bit [``.``]

            - values:

                | 0: Mode 3 code not present or not from Mode 5 reply/report
                | 1: Mode 3 code from Mode 5 reply/report.

            **MC**

            - 1 bit [``.``]

            - values:

                | 0: Flightlevel not present or not from Mode 5 reply/report
                | 1: Flightlevel from Mode 5 reply/report

            **PO**

            - 1 bit [``.``]

            - values:

                | 0: Position not from Mode 5 report (ADS-B report)
                | 1: Position from Mode 5 report

            remark
                Notes:

                    1. The flag M2 refers to the contents of Subfield #6 below, M3, MC refer
                       to the contents of data items I021/070 and I021/145 respectively. The
                       flag M1 refers to the contents of Subfield #3 below (Extended Mode 1
                       Code in Octal Representation).

                    2. If a Mode 5 reply/report is received with the Emergency bit set, then
                       the Military Emergency bit (ME) in Data Item I021/200, Target Status,
                       shall be set.

                    3. If a Mode 5 reply/report is received with the Identification of Position bit
                       set, then the Special Position Identification bit (SPI) in Data Item
                       I021/200, Target Status, shall be set.

                    4. If a Mode 5 report (ID or Data) is received and fullfill the autentication
                       criteria the corresponding authentication bit shall be set.

        **PNO** - *Mode 5 PIN /National Origin*

            ``(spare)``

            - 2 bits [``..``]

            **PIN** - *PIN Code*

            - 14 bits [``..............``]

            - raw value

            ``(spare)``

            - 5 bits [``.....``]

            **NO** - *National Origin Code*

            - 11 bits [``...........``]

            - raw value

        **EM1** - *Extended Mode 1 Code in Octal Representation*

            **V**

            - 1 bit [``.``]

            - values:

                | 0: Code validated
                | 1: Code not validated

            ``(spare)``

            - 1 bit [``.``]

            **L**

            - 1 bit [``.``]

            - values:

                | 0: Mode 1 code as derived from the report of the transponder
                | 1: Smoothed Mode 1 code as provided by a local tracker

            ``(spare)``

            - 1 bit [``.``]

            **EM1** - *Extended Mode 1 Code in Octal Representation*

            - 12 bits [``............``]

            - Octal string (3-bits per digit)

            remark
                Notes:

                    - Subfield #1 is present, the M1 bit in Subfield #1 indicates whether the
                      Extended Mode 1 Code is from a Mode 5 reply or a Mode 1 reply. If
                      Subfield #1 is not present, the Extended Mode 1 Code is from a Mode
                      1 reply.

                    - If Subfield #3 is not present the Mode 1 Code was not reported or all
                      Code Bits were equal to 0.

                    - The valid bit is set if the Code was only reported once for that target.

        **XP** - *X Pulse Presence*

            ``(spare)``

            - 2 bits [``..``]

            **XP** - *X-pulse from Mode 5 PIN reply/report*

            - 1 bit [``.``]

            - values:

                | 0: X-Pulse not present.
                | 1: X-pulse present.

            **X5** - *X-pulse from Mode 5 Data reply or Report.*

            - 1 bit [``.``]

            - values:

                | 0: X-pulse set to zero or no authenticated Data reply or Report received.
                | 1: X-pulse set to one (present).

            **XC** - *X-pulse from Mode C reply*

            - 1 bit [``.``]

            - values:

                | 0: X-pulse set to zero or no Mode C reply
                | 1: X-pulse set to one (present)

            **X3** - *X-pulse from Mode 3/A reply*

            - 1 bit [``.``]

            - values:

                | 0: X-pulse set to zero or no Mode 3/A reply"
                | 1: X-pulse set to one (present)

            **X2** - *X-pulse from Mode 2 reply*

            - 1 bit [``.``]

            - values:

                | 0: 0 X-pulse set to zero or no Mode 2 reply
                | 1: X-pulse set to one (present)

            **X1** - *X-pulse from Mode 1 reply*

            - 1 bit [``.``]

            - values:

                | 0: X-pulse set to zero or no Mode 1 reply
                | 1: X-pulse set to one (present)

            remark
                Within Mode 5 reports, the X-Pulse can be set for the following cases:

                1. In a combined Mode 1 and Mode 2 report: in this case the X5 bit and the X2 bit
                shall be set;

                2. In a combined Mode 3 and Mode C report: in this case the X5 bit and the X3
                bit shall be set;

                3. In a Mode 5 PIN data report: in this case the X5 bit and the XP bit shall be set.
                The X1 bit and the XC bit are meaningless as in Mode 1 and Mode C
                replies/reports the X Pulse is not defined. They are kept for compatibility
                reasons.

        **FOM** - *Figure of Merit*

            ``(spare)``

            - 3 bits [``...``]

            **FOM** - *Figure of Merit*

            - 5 bits [``.....``]

            - raw value

        **M2** - *Mode 2 Code in Octal Representation*

            **V**

            - 1 bit [``.``]

            - values:

                | 0: Code validated
                | 1: Code not validated

            ``(spare)``

            - 1 bit [``.``]

            **L**

            - 1 bit [``.``]

            - values:

                | 0: Mode-2 code as derived from the reply of the transponder
                | 1: Smoothed Mode-2 code as provided by a local tracker

            ``(spare)``

            - 1 bit [``.``]

            **ABCD** - *Mode 2 Code in Octal Representation*

            - 12 bits [``............``]

            - Octal string (3-bits per digit)

            remark
                If Subfield 6 is not present the Mode 2 Code was no reported or all
                Code Bits were equal to 0.

        remark
            Notes:

                - The Reserved Expansion Field is optional. When used to transmit MES, it shall
                  be sent when the targets are represented by Mode 5 Level 2 reports.

                - The information contained in this data item is specific to
                  1090MHz Extended Squitter messages transmitted by military
                  aircraft (Mode 5 Level 2 squitter).

