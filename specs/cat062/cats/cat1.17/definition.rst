Asterix category 062 - SDPS Track Messages
==========================================
**category**: 062

**edition**: 1.17

**date**: 2014-12-01

Preamble
--------
Surveillance data exchange.

Description of standard data items
----------------------------------

I062/010 - Data Source Identifier
*********************************

*Definition*: Identification of the system sending the data

*Structure*:

    **SAC** - *System Area Code*

    - 8 bits [``........``]

    - raw value

    **SIC** - *System Identification code*

    - 8 bits [``........``]

    - raw value


Note:
    - The up-to-date list of SACs is published on the
      EUROCONTROL Web Site (http://www.eurocontrol.int/asterix).

I062/015 - Service Identification
*********************************

*Definition*: Identification of the service provided to one or more users.

*Structure*:

- 8 bits [``........``]

- raw value



I062/040 - Track Number
***********************

*Definition*: Identification of a track

*Structure*:

- 16 bits [``................``]

- raw value



I062/060 - Track Mode 3/A Code
******************************

*Definition*: Mode-3/A code converted into octal representation.

*Structure*:

    **V** - *validated*

    - 1 bit [``.``]

    - values:

        | 0: Code validated
        | 1: Code not validated

    **G** - *garbled*

    - 1 bit [``.``]

    - values:

        | 0: Default
        | 1: Garbled code

    **CH** - *Change in Mode 3/A*

    - 1 bit [``.``]

    - values:

        | 0: No Change
        | 1: Mode 3/A has changed

    ``(spare)``

    - 1 bit [``.``]

    **ABCD** - *Mode-3/A reply in octal representation*

    - 12 bits [``............``]

    - raw value



I062/070 - Time Of Track Information
************************************

*Definition*: Absolute time stamping of the information provided
in the track message, in the form of elapsed time since
last mid night, expressed as UTC.

*Structure*:

- 24 bits [``........................``]

- unsigned quantity
- scaling factor: 1
- fractional bits: 7
- unit: "s"
- LSB = :math:`1 / {2^{7}}` s = :math:`1 / {128}` s :math:`\approx 0.0078125` s


Notes:

    1. This is the time of the track state vector.
    2. The time is reset to zero at every midnight.

I062/080 - Track Status
***********************

*Definition*: Status of a track.

*Structure*:

Extended item with first part ``8 bits`` long and optional ``8 bits`` extends.

    **MON**

    - 1 bit [``.``]

    - values:

        | 0: Multisensor track
        | 1: Monosensor track

    **SPI**

    - 1 bit [``.``]

    - values:

        | 0: default value
        | 1: SPI present in the last report received from a sensor capable of decoding this data

    **MRH** - *Most Reliable Height*

    - 1 bit [``.``]

    - values:

        | 0: Barometric altitude (Mode C) more reliable
        | 1: Geometric altitude more reliable

    **SRC** - *Source of calculated track altitude for I062/130*

    - 3 bits [``...``]

    - values:

        | 0: no source
        | 1: GNSS
        | 2: 3D radar
        | 3: triangulation
        | 4: height from coverage
        | 5: speed look-up table
        | 6: default height
        | 7: multilateration

    **CNF**

    - 1 bit [``.``]

    - values:

        | 0: Confirmed track
        | 1: Tentative track

    ``(FX)``

    - extension bit

        | 0: End of data item
        | 1: Extension into next extent

    **SIM**

    - 1 bit [``.``]

    - values:

        | 0: Actual track
        | 1: Simulated track

    **TSE**

    - 1 bit [``.``]

    - values:

        | 0: default value
        | 1: last message transmitted to the user for the track

    **TSB**

    - 1 bit [``.``]

    - values:

        | 0: default value
        | 1: first message transmitted to the user for the track

    **FPC**

    - 1 bit [``.``]

    - values:

        | 0: Not flight-plan correlated
        | 1: Flight plan correlated

    **AFF**

    - 1 bit [``.``]

    - values:

        | 0: default value
        | 1: ADS-B data inconsistent with other surveillance information

    **STP**

    - 1 bit [``.``]

    - values:

        | 0: default value
        | 1: Slave Track Promotion

    **KOS**

    - 1 bit [``.``]

    - values:

        | 0: Complementary service used
        | 1: Background service used

    ``(FX)``

    - extension bit

        | 0: End of data item
        | 1: Extension into next extent

    **AMA**

    - 1 bit [``.``]

    - values:

        | 0: track not resulting from amalgamation process
        | 1: track resulting from amalgamation process

    **MD4**

    - 2 bits [``..``]

    - values:

        | 0: No Mode 4 interrogation
        | 1: Friendly target
        | 2: Unknown target
        | 3: No reply

    **ME**

    - 1 bit [``.``]

    - values:

        | 0: default value
        | 1: Military Emergency present in the last report received from a sensor capable of decoding this data

    **MI**

    - 1 bit [``.``]

    - values:

        | 0: default value
        | 1: Military Identification present in the last report received from a sensor capable of decoding this data

    **MD5**

    - 2 bits [``..``]

    - values:

        | 0: No Mode 5 interrogation
        | 1: Friendly target
        | 2: Unknown target
        | 3: No reply

    ``(FX)``

    - extension bit

        | 0: End of data item
        | 1: Extension into next extent

    **CST**

    - 1 bit [``.``]

    - values:

        | 0: default value
        | 1: Age of the last received track update is higher than system dependent threshold (coasting)

    **PSR**

    - 1 bit [``.``]

    - values:

        | 0: default value
        | 1: Age of the last received PSR track update is higher than system dependent threshold

    **SSR**

    - 1 bit [``.``]

    - values:

        | 0: default value
        | 1: Age of the last received SSR track update is higher than system dependent threshold

    **MDS**

    - 1 bit [``.``]

    - values:

        | 0: default value
        | 1: Age of the last received Mode S track update is higher than system dependent threshold

    **ADS**

    - 1 bit [``.``]

    - values:

        | 0: default value
        | 1: Age of the last received ADS-B track update is higher than system dependent threshold

    **SUC**

    - 1 bit [``.``]

    - values:

        | 0: default value
        | 1: Special Used Code (Mode A codes to be defined in the system to mark a track with special interest)

    **AAC**

    - 1 bit [``.``]

    - values:

        | 0: default value
        | 1: Assigned Mode A Code Conflict (same discrete Mode A Code assigned to another track)

    ``(FX)``

    - extension bit

        | 0: End of data item
        | 1: Extension into next extent

    **SDS**

    - 2 bits [``..``]

    - values:

        | 0: Combined
        | 1: Co-operative only
        | 2: Non-Cooperative only
        | 3: Not defined

    **EMS**

    - 3 bits [``...``]

    - values:

        | 0: No emergency
        | 1: General emergency
        | 2: Lifeguard / medical
        | 3: Minimum fuel
        | 4: No communications
        | 5: Unlawful interference
        | 6: "Downed" Aircraft
        | 7: Undefined

    **PFT**

    - 1 bit [``.``]

    - values:

        | 0: No indication
        | 1: Potential False Track Indication

    **FPLT**

    - 1 bit [``.``]

    - values:

        | 0: Default value
        | 1: Track created / updated with FPL data

    ``(FX)``

    - extension bit

        | 0: End of data item
        | 1: Extension into next extent

    **DUPT**

    - 1 bit [``.``]

    - values:

        | 0: Default value
        | 1: Duplicate Mode 3/A Code

    **DUPF**

    - 1 bit [``.``]

    - values:

        | 0: Default value
        | 1: Duplicate Flight Plan

    **DUPM**

    - 1 bit [``.``]

    - values:

        | 0: Default value
        | 1: Duplicate Flight Plan due to manual correlation

    ``(spare)``

    - 4 bits [``....``]

    ``(FX)``

    - extension bit

        | 0: End of data item
        | 1: Extension into next extent


Notes:

    1. Track type and coasting can also be derived from I062/290 System Track Update Ages
    2. If the system supports the technology, default value (0) means that the technology was used to produce the report
    3. If the system does not support the technology, default value is meaningless.
    4. Bits (EMS): other than subfield #11 of data item I062/380, these
       bits allow the SDPS to set the emergency indication as derived from
       other sources than ADS-B (e.g. based on the Mode 3/A code).
    5. Bit (PFT): with this flag an SDPS can indicate that internal
       processing points to the track being potentially false. Details on the
       internal processing are system dependent.
    6. Bit (FPLT): this bit - if set - indicates that the information contained
       in the target report has been updated by flight plan related data
       because no surveillance data was available for the target, or was
       created based on flight plan related data in areas with no
       surveillance.
    7. Bit (DUPT) is set to 1 if the correlation between the target report and a flight
       plan is not possible because the Mode 3/A code stated in the flight plan exists
       more than once in the surveillance data.
    8. Bit (DUPF) - if set to 1 - indicates that for a specific surveillance target more
       than one flight plan exists which makes correlation impossible.
    9. Bit (DUPM) is set to 1 if a target was correlated manually but also a regular
       flight plan exists.
    10. All tracks for which bits DUPT, DUPF or DUPM are set to 1 are marked on the CWP.

I062/100 - Calculated Track Position
************************************

*Definition*: Calculated position in Cartesian co-ordinates with a resolution of
0.5m, in two's complement form.

*Structure*:

    **X** - *x-coordinate*

    - 24 bits [``........................``]

    - signed quantity
    - scaling factor: 1
    - fractional bits: 1
    - unit: "m"
    - LSB = :math:`1 / {2^{1}}` m = :math:`1 / {2}` m :math:`\approx 0.5` m

    **Y** - *y-coordinate*

    - 24 bits [``........................``]

    - signed quantity
    - scaling factor: 1
    - fractional bits: 1
    - unit: "m"
    - LSB = :math:`1 / {2^{1}}` m = :math:`1 / {2}` m :math:`\approx 0.5` m



I062/105 - Calculated Position In WGS-84 Co-ordinates
*****************************************************

*Definition*: Calculated Position in WGS-84 Co-ordinates with a resolution of
:math:`180/2^{25}` degrees.

*Structure*:

    **LAT** - *Latitude*

    - 32 bits [``................................``]

    - signed quantity
    - scaling factor: 180
    - fractional bits: 25
    - unit: "deg"
    - LSB = :math:`180 / {2^{25}}` deg = :math:`180 / {33554432}` deg :math:`\approx 5.364418029785156e-06` deg
    - value :math:`>= -90` deg
    - value :math:`<= 90` deg

    **LON** - *Longitude*

    - 32 bits [``................................``]

    - signed quantity
    - scaling factor: 180
    - fractional bits: 25
    - unit: "deg"
    - LSB = :math:`180 / {2^{25}}` deg = :math:`180 / {33554432}` deg :math:`\approx 5.364418029785156e-06` deg
    - value :math:`>= -180` deg
    - value :math:`< 180` deg


Notes:

    - The LSB provides a resolution at least better than 0.6m.

I062/110 - Mode 5 Data reports & Extended Mode 1 Code
*****************************************************

*Definition*: Mode 5 Data reports & Extended Mode 1 Code.

*Structure*:

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

            | 0: No authenticated Mode 5 ID reply
            | 1: Authenticated Mode 5 ID reply

        **DA**

        - 1 bit [``.``]

        - values:

            | 0: No authenticated Mode 5 Data reply or Repor
            | 1: Authenticated Mode 5 Data reply or Report (i.e any valid Mode 5 reply type other than ID)

        **M1**

        - 1 bit [``.``]

        - values:

            | 0: Mode 1 code not present or not from Mode 5 reply
            | 1: Mode 1 code from Mode 5 reply

        **M2**

        - 1 bit [``.``]

        - values:

            | 0: Mode 2 code not present or not from Mode 5 reply
            | 1: Mode 2 code from Mode 5 reply

        **M3**

        - 1 bit [``.``]

        - values:

            | 0: Mode 3 code not present or not from Mode 5 reply
            | 1: Mode 3 code from Mode 5 reply

        **MC**

        - 1 bit [``.``]

        - values:

            | 0: Mode C altitude code not present or not from Mode 5 reply
            | 1: Mode C altitude from Mode 5 reply

        **X** - *X-pulse from Mode 5 Data reply or Report*

        - 1 bit [``.``]

        - values:

            | 0: X-pulse set to zero or no authenticated Data reply or Report received.
            | 1: X-pulse set to one

    **PMN** - *Mode 5 PIN/ National Origin/Mission Code*

        ``(spare)``

        - 2 bits [``..``]

        **PIN** - *PIN Code*

        - 14 bits [``..............``]

        - raw value

        ``(spare)``

        - 3 bits [``...``]

        **NAT** - *National Origin*

        - 5 bits [``.....``]

        - raw value

        ``(spare)``

        - 2 bits [``..``]

        **MIS** - *Mission Code*

        - 6 bits [``......``]

        - raw value

    **POS** - *Mode 5 Reported Position*

        **LAT** - *Latitude*

        - 24 bits [``........................``]

        - signed quantity
        - scaling factor: 180
        - fractional bits: 23
        - unit: "deg"
        - LSB = :math:`180 / {2^{23}}` deg = :math:`180 / {8388608}` deg :math:`\approx 2.1457672119140625e-05` deg
        - value :math:`>= -90` deg
        - value :math:`<= 90` deg

        **LON** - *Longitude*

        - 24 bits [``........................``]

        - signed quantity
        - scaling factor: 180
        - fractional bits: 23
        - unit: "deg"
        - LSB = :math:`180 / {2^{23}}` deg = :math:`180 / {8388608}` deg :math:`\approx 2.1457672119140625e-05` deg
        - value :math:`>= -180` deg
        - value :math:`< 180` deg

    **GA** - *Mode 5 GNSS-derived Altitude*

        ``(spare)``

        - 1 bit [``.``]

        **RES** - *Resolution with which the GNSS-derived Altitude (GA) is reported*

        - 1 bit [``.``]

        - values:

            | 0: GA reported in 100 ft increments.
            | 1: GA reported in 25 ft increments.

        **GA** - *GNSS-derived Altitude of target, expressed as height above WGS 84 ellipsoid.*

        - 14 bits [``..............``]

        - signed quantity
        - scaling factor: 25
        - fractional bits: 0
        - unit: "ft"
        - LSB = :math:`25` ft
        - value :math:`>= -1000` ft

    **EM1** - *Extended Mode 1 Code in Octal Representation*

        ``(spare)``

        - 4 bits [``....``]

        **EM1** - *Extended Mode 1 reply in octal representation*

        - 12 bits [``............``]

        - raw value

    **TOS** - *Time Offset for POS and GA*

    Time Offset coded as a twos complement number with an LSB of 1/128 s. The time at which the Mode 5 Reported Position (Subfield #3) and Mode 5 GNSS-derived Altitude (Subfield #4) are valid is given by Time of Day (I048/140) plus Time Offset.

    - 8 bits [``........``]

    - signed quantity
    - scaling factor: 1
    - fractional bits: 7
    - unit: "s"
    - LSB = :math:`1 / {2^{7}}` s = :math:`1 / {128}` s :math:`\approx 0.0078125` s

    **XP** - *X Pulse Presence*

        ``(spare)``

        - 3 bits [``...``]

        **X5** - *X-pulse from Mode 5 Data reply or Report*

        - 1 bit [``.``]

        - values:

            | 0: X-pulse set to zero or no authenticated Data reply or Report received.
            | 1: X-pulse set to one (present).

        **XC** - *X-pulse from Mode C reply*

        - 1 bit [``.``]

        - values:

            | 0: X-pulse set to zero or no Mode C reply.
            | 1: X-pulse set to one (present).

        **X3** - *X-pulse from Mode 3/A reply*

        - 1 bit [``.``]

        - values:

            | 0: X-pulse set to zero or no Mode 3/A reply.
            | 1: X-pulse set to one (present).

        **X2** - *X-pulse from Mode 2 reply*

        - 1 bit [``.``]

        - values:

            | 0: X-pulse set to zero or no Mode 2 reply.
            | 1: X-pulse set to one (present).

        **X1** - *X-pulse from Mode 1 reply*

        - 1 bit [``.``]

        - values:

            | 0: X-pulse set to zero or no Mode 1 reply.
            | 1: X-pulse set to one (present).


Notes:

    1. The flags M2, M3, MC refer to the contents of data subitems I062/120,
       I062/060 and I062/135 respectively. The flag M1 refers to the contents
       of the Subfield #5 (Extended Mode 1 Code in Octal Representation).
    2. If an authenticated Mode 5 reply is received with the Emergency
       bit set, then the Military Emergency bit (ME) in Data Item I062/080,
       Track Status, shall be set.
    3. If an authenticated Mode 5 reply is received with the Identification
       of Position bit set, then the Special Position Identification
       bit (SPI) in Data Item I062/080, Track Status, shall be set.
    4. The resolution implied by the LSB is better than the resolution
       with which Mode 5 position reports are transmitted from aircraft
       transponders using currently defined formats.
    5. GA is coded as a 14-bit two's complement binary number with
       an LSB of 25 ft. irrespective of the setting of RES.
    6. The minimum value of GA that can be reported is -1000 ft.
    7. If Subfield #1 is present, the M1 bit in Subfield #1 indicates
       whether the Extended Mode 1 Code is from a Mode 5 reply or
       a Mode 1 reply. If Subfield #1 is not present, the Extended
       Mode 1 Code is from a Mode 1 reply.
    8. TOS shall be assumed to be zero if Subfield #6 is not present.

I062/120 - Track Mode 2 Code
****************************

*Definition*: Mode 2 code associated to the track

*Structure*:

    ``(spare)``

    - 4 bits [``....``]

    **ABCD** - *Mode-2 code in octal representation*

    - 12 bits [``............``]

    - raw value



I062/130 - Calculated Track Geometric Altitude
**********************************************

*Definition*: Vertical distance between the target and the projection of its position
on the earth's ellipsoid, as defined by WGS84, in two's complement form.

*Structure*:

- 16 bits [``................``]

- unsigned quantity
- scaling factor: 6.25
- fractional bits: 0
- unit: "ft"
- LSB = :math:`6.25` ft
- value :math:`>= -1500` ft
- value :math:`<= 150000` ft


Notes:

    1. LSB is required to be less than 10 ft by ICAO
    2. The source of altitude is identified in bits (SRC) of item
       I062/080 Track Status.

I062/135 - Calculated Track Barometric Altitude
***********************************************

*Definition*: Calculated Barometric Altitude of the track, in two's complement form.

*Structure*:

    **QNH**

    - 1 bit [``.``]

    - values:

        | 0: No QNH correction applied
        | 1: QNH correction applied

    **CTB** - *Calculated Track Barometric Altitude*

    - 15 bits [``...............``]

    - signed quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "FL"
    - LSB = :math:`1 / {2^{2}}` FL = :math:`1 / {4}` FL :math:`\approx 0.25` FL
    - value :math:`>= -15` FL
    - value :math:`<= 1500` FL


Notes:

    1) ICAO specifies a range between -10 FL and 1267 FL for Mode C

I062/136 - Measured Flight Level
********************************

*Definition*: Last valid and credible flight level used to update the track, in two's
complement form.

*Structure*:

- 16 bits [``................``]

- signed quantity
- scaling factor: 1
- fractional bits: 2
- unit: "FL"
- LSB = :math:`1 / {2^{2}}` FL = :math:`1 / {4}` FL :math:`\approx 0.25` FL
- value :math:`>= -15` FL
- value :math:`<= 1500` FL


Notes:

    1. The criteria to determine the credibility of the flight level
       are Tracker dependent.
    2. Credible means: within reasonable range of change with respect
       to the previous detection.
    3. ICAO specifies a range between -10 FL and 1267 FL for Mode C.
    4. This item includes the barometric altitude received from ADS-B.

I062/185 - Calculated Track Velocity (Cartesian)
************************************************

*Definition*: Calculated track velocity expressed in Cartesian co-ordinates,in
two's complement form.

*Structure*:

    **VX**

    - 16 bits [``................``]

    - signed quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "m/s"
    - LSB = :math:`1 / {2^{2}}` m/s = :math:`1 / {4}` m/s :math:`\approx 0.25` m/s
    - value :math:`>= -8192` m/s
    - value :math:`<= 8191.75` m/s

    **VY**

    - 16 bits [``................``]

    - signed quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "m/s"
    - LSB = :math:`1 / {2^{2}}` m/s = :math:`1 / {4}` m/s :math:`\approx 0.25` m/s
    - value :math:`>= -8192` m/s
    - value :math:`<= 8191.75` m/s


Notes:

    - The y-axis points to the Geographical North at the location of
      the target.

I062/200 - Mode of Movement
***************************

*Definition*: Calculated Mode of Movement of a target.

*Structure*:

    **TRANS** - *Transversal Acceleration*

    - 2 bits [``..``]

    - values:

        | 0: Constant Course
        | 1: Right Turn
        | 2: Left Turn
        | 3: Undetermined

    **LONG** - *Longitudinal Acceleration*

    - 2 bits [``..``]

    - values:

        | 0: Constant Groundspeed
        | 1: Increasing Groundspeed
        | 2: Decreasing Groundspeed
        | 3: Undetermined

    **VERT** - *Transversal Acceleration*

    - 2 bits [``..``]

    - values:

        | 0: Level
        | 1: Climb
        | 2: Descent
        | 3: Undetermined

    **ADF** - *Altitude Discrepancy Flag*

    - 1 bit [``.``]

    - values:

        | 0: No altitude discrepancy
        | 1: Altitude discrepancy

    ``(spare)``

    - 1 bit [``.``]


Notes:

    - The ADF, if set, indicates that a difference has been detected
      in the altitude information derived from radar as compared to
      other technologies (such as ADS-B).

I062/210 - Calculated Acceleration (Cartesian)
**********************************************

*Definition*: Calculated Acceleration of the target expressed in Cartesian co-ordinates,
in two's complement form.

*Structure*:

    **Ax**

    - 8 bits [``........``]

    - signed quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "m/s2"
    - LSB = :math:`1 / {2^{2}}` m/s2 = :math:`1 / {4}` m/s2 :math:`\approx 0.25` m/s2

    **Ay**

    - 8 bits [``........``]

    - signed quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "m/s2"
    - LSB = :math:`1 / {2^{2}}` m/s2 = :math:`1 / {4}` m/s2 :math:`\approx 0.25` m/s2


Notes:

    1. The y-axis points to the Geographical North at the location of the target.
    2. Maximum value means maximum value or above.

I062/220 - Calculated Rate Of Climb/Descent
*******************************************

*Definition*: Calculated rate of Climb/Descent of an aircraft in two's complement form.

*Structure*:

- 16 bits [``................``]

- signed quantity
- scaling factor: 6.25
- fractional bits: 0
- unit: "ft/min"
- LSB = :math:`6.25` ft/min


Notes:

    1. A positive value indicates a climb, whereas a negative value
       indicates a descent.

I062/245 - Target Identification
********************************

*Definition*: Target (aircraft or vehicle) identification in 8 characters.

*Structure*:

    **STI**

    - 2 bits [``..``]

    - values:

        | 0: Callsign or registration downlinked from target
        | 1: Callsign not downlinked from target
        | 2: Registration not downlinked from target
        | 3: Invalid

    ``(spare)``

    - 6 bits [``......``]

    **CHR** - *Characters 1-8 (coded on 6 bits each) defining target identification*

    - 48 bits [``................................................``]

    - ICAO string (6-bits per character)


Notes:

    1. For coding, see section 3.1.2.9 of [Ref.3]
    2. As the Callsign of the target can already be transmitted
       (thanks to I062/380 Subfield #2 if downlinked from the
       aircraft or thanks to I062/390 Subfield #2 if the target
       is correlated to a flight plan), and in order to avoid
       confusion at end user's side, this item SHALL not be used.

I062/270 - Target Size & Orientation
************************************

*Definition*: Target size defined as length and width of the detected target, and orientation.

*Structure*:

Extended item with first part ``8 bits`` long and optional ``8 bits`` extends.

    **LENGTH** - *Length*

    Length

    - 7 bits [``.......``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 0
    - unit: "m"
    - LSB = :math:`1` m

    ``(FX)``

    - extension bit

        | 0: End of data item
        | 1: Extension into next extent

    **ORIENTATION** - *Orientation*

    Length

    - 7 bits [``.......``]

    - unsigned quantity
    - scaling factor: 360
    - fractional bits: 7
    - unit: "deg"
    - LSB = :math:`360 / {2^{7}}` deg = :math:`360 / {128}` deg :math:`\approx 2.8125` deg

    ``(FX)``

    - extension bit

        | 0: End of data item
        | 1: Extension into next extent

    **WIDTH** - *Width*

    Length

    - 7 bits [``.......``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 0
    - unit: "m"
    - LSB = :math:`1` m

    ``(FX)``

    - extension bit

        | 0: End of data item
        | 1: Extension into next extent


Notes:

    1. The orientation gives the direction which the target nose is
       pointing to,relative to the Geographical North.
    2. When the length only is sent, the largest dimension is provided.

I062/290 - System Track Update Ages
***********************************

*Definition*: Ages of the last plot/local track/target report update for each sensor type.

*Structure*:

Compound item (FX)

    **TRK**

    Actual track age since occurence

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 255/4` s

    **PSR**

    Age of the last primary detection used to update the track

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **SSR**

    Age of the last secondary detection used to update the track

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **MDS**

    Age of the last Mode S detection used to update the track

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **ADS**

    Age of the last ADS-C report used to update the track

    - 16 bits [``................``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 16383.75` s

    **ES**

    Age of the last 1090 Extended Squitter ADS-B report used to update the track

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **VDL**

    Age of the last VDL Mode 4 ADS-B report used to update the track

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **UAT**

    Age of the last UAT ADS-B report used to update the track

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **LOP**

    Age of the last magnetic loop detection

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **MLT**

    Age of the last MLT detection

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s


Notes:

    1. Except for Track Age, the ages are counted from Data Item I062/070,
       Time Of Track Information, using the following formula:
       Age = Time of track information - Time of last detection used
       to update the track
    2. The time of last detection is derived from monosensor category time of day
    3. If the data has never been received, then the corresponding
       subfield is not sent.
    4. Maximum value means maximum value or above.

I062/295 - Track Data Ages
**************************

*Definition*: Ages of the data provided.

*Structure*:

Compound item (FX)

    **MFL** - *Measured Flight Level Age*

    Age of the last valid and credible Mode C code or barometric altitude from ADS-B used to update the track (I062/136).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **MD1** - *Mode 1 Age*

    Age of the last valid and credible Mode 1 code used to update the track (I062/110).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **MD2** - *Mode 2 Age*

    Age of the last valid and credible Mode 2 code used to update the track (I062/120).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **MDA** - *Mode 3/A Age*

    Age of the last valid and credible Mode 3/A code used to update the track (I062/060).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **MD4** - *Mode 4 Age*

    Age of the last valid and credible Mode 4 code used to update the track.

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **MD5** - *Mode 5 Age*

    Age of the last valid and credible Mode 5 code used to update the track (I062/110).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **MHG** - *Magnetic Heading Age*

    Age of the DAP "Magnetic Heading" in item 062/380 (Subfield #3).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **IAS** - *Indicated Airspeed / Mach Nb age*

    Age of the DAP "Indicated Airspeed/Mach Number" in item 062/380 (Subfield #4).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **TAS** - *True Airspeed Age*

    Age of the DAP "True Airspeed" in item 062/380 (Subfield #5).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **SAL** - *Selected Altitude Age*

    Age of the DAP "Selected Altitude" in item 062/380 (Subfield #6).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **FSS** - *Final State Selected Altitude Age*

    Age of the DAP "Final State Selected Altitude Age" in item 062/380 (Subfield #7).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **TID** - *Trajectory Intent Age*

    Age of the DAP "Trajectory Intent" in item 062/380 (Subfield #8).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **COM** - *Communication/ACAS Capability and Flight Status Age*

    Age of the DAP "Communication/ACAS Capability and Flight Status" in item 062/380 (Subfield #10).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **SAB** - *Status Reported by ADS-B Age*

    Age of the DAP "Status Reported by ADS-B" in item 062/380 (Subfield #11).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **ACS** - *ACAS Resolution Advisory Report Age*

    Age of the DAP "ACAS Resolution Advisory Report" in item 062/380 (Subfield #12).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **BVR** - *Barometric Vertical Rate Age*

    Age of the DAP "Barometric Vertical Rate" in item 062/380 (Subfield #13).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **GVR** - *Geometrical Vertical Rate Age*

    Age of the DAP "Geometrical Vertical Rate" in item 062/380 (Subfield #14).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **RAN** - *Roll Angle Age*

    Age of the DAP "Roll Angle" in item 062/380 (Subfield #15).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **TAR** - *Track Angle Rate Age*

    Age of the DAP "Track Angle Rate" in item 062/380 (Subfield #16).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **TAN** - *Track Angle Age*

    Age of the DAP "Track Angle" in item 062/380 (Subfield #17).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **GSP** - *Ground Speed Age*

    Age of the DAP "Ground Speed" in item 062/380 (Subfield #18).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **VUN** - *Velocity Uncertainty Age*

    Age of the DAP "Velocity Uncertainty" in item 062/380 (Subfield #19).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **MET** - *Meteorological Data Age*

    Age of the DAP "Meteorological Data" in item 062/380 (Subfield #20).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **EMC** - *Emitter Category Age*

    Age of the DAP "Emitter Category" in item 062/380 (Subfield #21).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **POS** - *Position Age*

    Age of the DAP "Position" in item 062/380 (Subfield #23).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **GAL** - *Geometric Altitude Age*

    Age of the DAP "Geometric Altitude" in item 062/380 (Subfield #24).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **PUN** - *Position Uncertainty Age*

    Age of the DAP "Position Uncertainty" in item 062/380 (Subfield #25).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **MB** - *Mode S MB Data Age*

    Age of the DAP "Mode S MB Data" in item 062/380 (Subfield #22).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **IAR** - *Indicated Airspeed Data Age*

    Age of the DAP "Indicated Airspeed" in item 062/380 (Subfield #26).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **MAC** - *Mach Number Data Age*

    Age of the DAP "Mach Number" in item 062/380 (Subfield #27).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s

    **BPS** - *Barometric Pressure Setting Data Age*

    Age of the DAP "Barometric Pressure Setting" in item 062/380 (Subfield #28).

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "s"
    - LSB = :math:`1 / {2^{2}}` s = :math:`1 / {4}` s :math:`\approx 0.25` s
    - value :math:`<= 63.75` s


Notes:

    1. Despite there are now two subfields (#29 and #30) reporting the ages
       of, respectively, the Indicated Airspeed track data and the Mach
       Number track data, the subfield #8 (and so its presence bit , bit-32) is
       kept free in order to prevent a full incompatibility with previous
       releases of ASTERIX Cat. 062 already implemented.
    2. In all the subfields, the age is the time delay since the value was
       measured

I062/300 - Vehicle Fleet Identification
***************************************

*Definition*: Vehicle fleet identification number.

*Structure*:

- 8 bits [``........``]

- values:

    | 0: Unknown
    | 1: ATC equipment maintenance
    | 2: Airport maintenance
    | 3: Fire
    | 4: Bird scarer
    | 5: Snow plough
    | 6: Runway sweeper
    | 7: Emergency
    | 8: Police
    | 9: Bus
    | 10: Tug (push/tow)
    | 11: Grass cutter
    | 12: Fuel
    | 13: Baggage
    | 14: Catering
    | 15: Aircraft maintenance
    | 16: Flyco (follow me)



I062/340 - Measured Information
*******************************

*Definition*: All measured data related to the last report used to update the track.
These data are not used for ADS-B.

*Structure*:

Compound item (FX)

    **SID** - *Sensor Identification*

        **SAC** - *System Area Code*

        - 8 bits [``........``]

        - raw value

        **SIC** - *System Identification code*

        - 8 bits [``........``]

        - raw value

    **POS** - *Measured Position*

        **RHO** - *Measured distance*

        - 16 bits [``................``]

        - unsigned quantity
        - scaling factor: 1
        - fractional bits: 8
        - unit: "NM"
        - LSB = :math:`1 / {2^{8}}` NM = :math:`1 / {256}` NM :math:`\approx 0.00390625` NM
        - value :math:`<= 256` NM

        **THETA** - *Measured azimuth*

        - 16 bits [``................``]

        - unsigned quantity
        - scaling factor: 360
        - fractional bits: 16
        - unit: "deg"
        - LSB = :math:`360 / {2^{16}}` deg = :math:`360 / {65536}` deg :math:`\approx 0.0054931640625` deg

    **HEIGHT** - *Measured 3-D Height*

    - 16 bits [``................``]

    - unsigned quantity
    - scaling factor: 25
    - fractional bits: 0
    - unit: "ft"
    - LSB = :math:`25` ft

    **MDC**

        **V**

        - 1 bit [``.``]

        - values:

            | 0: Code validated
            | 1: Code not validated

        **G**

        - 1 bit [``.``]

        - values:

            | 0: Default
            | 1: Garbled code

        **LMC**

        Last Measured Mode C Code, in two's complement form

        - 14 bits [``..............``]

        - signed quantity
        - scaling factor: 1
        - fractional bits: 2
        - unit: "FL"
        - LSB = :math:`1 / {2^{2}}` FL = :math:`1 / {4}` FL :math:`\approx 0.25` FL
        - value :math:`>= -12` FL
        - value :math:`<= 1270` FL

    **MDA**

        **V**

        - 1 bit [``.``]

        - values:

            | 0: Code validated
            | 1: Code not validated

        **G**

        - 1 bit [``.``]

        - values:

            | 0: Default
            | 1: Garbled code

        **L**

        - 1 bit [``.``]

        - values:

            | 0: MODE 3/A code as derived from the reply of the transponder,
            | 1: MODE 3/A code as provided by a sensor local tracker.

        ``(spare)``

        - 1 bit [``.``]

        **ABCD** - *Mode-3/A reply under the form of 4 digits in octal representation*

        - 12 bits [``............``]

        - raw value

    **TYP**

        **TYP**

        - 3 bits [``...``]

        - values:

            | 0: No detection
            | 1: Single PSR detection
            | 2: Single SSR detection
            | 3: SSR + PSR detection
            | 4: Single ModeS All-Call
            | 5: Single ModeS Roll-Call
            | 6: ModeS All-Call + PSR
            | 7: ModeS Roll-Call +PSR

        **SIM**

        - 1 bit [``.``]

        - values:

            | 0: Actual target report
            | 1: Simulated target report

        **RAB**

        - 1 bit [``.``]

        - values:

            | 0: Report from target transponder
            | 1: Report from field monitor (item transponder)

        **TST**

        - 1 bit [``.``]

        - values:

            | 0: Real target report
            | 1: Test target report

        ``(spare)``

        - 2 bits [``..``]


Notes:

    1. In case of a plot, the measured bias-corrected polar co-ordinates;
    2. In case of a sensor local track, the measured bias-corrected
       polar co-ordinates of the plot associated to the track;
    3. In case of a local track without detection, the extrapolated
       bias-corrected polar co-ordinates.
    4. Smoothed MODE 3/A data (L = 1) will be used in case of absence of
       MODE 3/A code information in the plot or in case of difference
       between plot and sensor local track MODE 3/A code information.

I062/380 - Aircraft Derived Data
********************************

*Definition*: Data derived directly by the aircraft.

*Structure*:

Compound item (FX)

    **ADR** - *Target address*

    - 24 bits [``........................``]

    - raw value

    **ID** - *Target Identification*

    Characters 1-8 (coded on 6 bits each) defining a target identification when flight plan is available or the registration marking when no flight plan is available. Coding rules are provided in [3] Section 3.1.2.9.1.2 and Table 3-9"

    - 48 bits [``................................................``]

    - raw value

    **MHG** - *Magnetic Heading*

    - 16 bits [``................``]

    - unsigned quantity
    - scaling factor: 360
    - fractional bits: 16
    - unit: "deg"
    - LSB = :math:`360 / {2^{16}}` deg = :math:`360 / {65536}` deg :math:`\approx 0.0054931640625` deg

    **IAS** - *Indicated Airspeed/Mach No*

        **IM**

        - 1 bit [``.``]

        - values:

            | 0: Air Speed = IAS, LSB (Bit-1) = 2 -14 NM/s
            | 1: Air Speed = Mach, LSB (Bit-1) = 0.001

        **IAS**

        - 15 bits [``...............``]

        * Content of this item depends on the value of item ``380/IAS/IM``.

            * In case of ``380/IAS/IM == 0``:
                - unsigned quantity
                - scaling factor: 1
                - fractional bits: 14
                - unit: "NM/s"
                - LSB = :math:`1 / {2^{14}}` NM/s = :math:`1 / {16384}` NM/s :math:`\approx 6.103515625e-05` NM/s

            * In case of ``380/IAS/IM == 1``:
                - unsigned quantity
                - scaling factor: 0.001
                - fractional bits: 0
                - unit: "mach"
                - LSB = :math:`0.001` mach


    **TAS** - *True Air Speed*

    - 16 bits [``................``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 0
    - unit: "kt"
    - LSB = :math:`1` kt
    - value :math:`>= 0` kt
    - value :math:`<= 2046` kt

    **SAL** - *Selected Altitude*

        **SAS**

        - 1 bit [``.``]

        - values:

            | 0: No source information provided
            | 1: Source information provided

        **SRC**

        - 2 bits [``..``]

        - values:

            | 0: Unknown
            | 1: Aircraft Altitude
            | 2: FCU/MCP Selected Altitude
            | 3: FMS Selected Altitude

        **ALT** - *Altitude in two's complement form*

        - 13 bits [``.............``]

        - signed quantity
        - scaling factor: 25
        - fractional bits: 0
        - unit: "ft"
        - LSB = :math:`25` ft
        - value :math:`>= -1300` ft
        - value :math:`<= 100000` ft

    **FSS** - *Final State Selected Altitude*

        **MV**

        Manage Vertical Mode

        - 1 bit [``.``]

        - values:

            | 0: Not active
            | 1: Active

        **AH**

        Altitude Hold

        - 1 bit [``.``]

        - values:

            | 0: Not active
            | 1: Active

        **AM**

        Approach Mode

        - 1 bit [``.``]

        - values:

            | 0: Not active
            | 1: Active

        **Altitude** - *Altitude in two's complement form*

        - 13 bits [``.............``]

        - signed quantity
        - scaling factor: 25
        - fractional bits: 0
        - unit: "ft"
        - LSB = :math:`25` ft
        - value :math:`>= -1300` ft
        - value :math:`<= 100000` ft

    **TIS** - *Trajectory Intent Status*

    Extended item with first part ``8 bits`` long and optional ``8 bits`` extends.

        **NAV**

        - 1 bit [``.``]

        - values:

            | 0: Trajectory Intent Data is available for this aircraft
            | 1: Trajectory Intent Data is not available for this aircraft

        **NVB**

        - 1 bit [``.``]

        - values:

            | 0: Trajectory Intent Data is valid
            | 1: Trajectory Intent Data is not valid

        ``(spare)``

        - 5 bits [``.....``]

        ``(FX)``

        - extension bit

            | 0: End of data item
            | 1: Extension into next extent

    **TID** - *Trajectory Intent Data*

    Repetitive item, repetition factor 8 bits.

            **TCA**

            - 1 bit [``.``]

            - values:

                | 0: TCP number available
                | 1: TCP number not available

            **NC**

            - 1 bit [``.``]

            - values:

                | 0: TCP compliance
                | 1: TCP non-compliance

            **TCPNumber**

            Trajectory Change Point number

            - 6 bits [``......``]

            - raw value

            **Altitude** - *Altitude in two's complement form*

            - 16 bits [``................``]

            - signed quantity
            - scaling factor: 10
            - fractional bits: 0
            - unit: "ft"
            - LSB = :math:`10` ft
            - value :math:`>= -1500` ft
            - value :math:`<= 150000` ft

            **Latitude** - *In WGS.84 in rwo's complementde in two's complement.*

            - 24 bits [``........................``]

            - unsigned quantity
            - scaling factor: 180
            - fractional bits: 23
            - unit: "deg"
            - LSB = :math:`180 / {2^{23}}` deg = :math:`180 / {8388608}` deg :math:`\approx 2.1457672119140625e-05` deg
            - value :math:`>= -90` deg
            - value :math:`<= 90` deg

            **Longitude** - *In WGS.84 in rwo's complementde in two's complement.*

            - 24 bits [``........................``]

            - unsigned quantity
            - scaling factor: 180
            - fractional bits: 23
            - unit: "deg"
            - LSB = :math:`180 / {2^{23}}` deg = :math:`180 / {8388608}` deg :math:`\approx 2.1457672119140625e-05` deg
            - value :math:`>= -180` deg
            - value :math:`< 180` deg

            **PT** - *Point Type*

            - 4 bits [``....``]

            - values:

                | 0: Unknown
                | 1: Fly by waypoint (LT)
                | 2: Fly over waypoint (LT)
                | 3: Hold pattern (LT)
                | 4: Procedure hold (LT)
                | 5: Procedure turn (LT)
                | 6: RF leg (LT)
                | 7: Top of climb (VT)
                | 8: Top of descent (VT)
                | 9: Start of level (VT)
                | 10: Cross-over altitude (VT)
                | 11: Transition altitude (VT)

            **TD**

            - 2 bits [``..``]

            - values:

                | 0: N/A
                | 1: Turn right
                | 2: Turn left
                | 3: No turn

            **TRA**

            Turn Radius Availability

            - 1 bit [``.``]

            - values:

                | 0: TTR not available
                | 1: TTR available

            **TOA**

            - 1 bit [``.``]

            - values:

                | 0: TOV available
                | 1: TOV not available

            **TOV** - *Time Over Point*

            - 24 bits [``........................``]

            - unsigned quantity
            - scaling factor: 1
            - fractional bits: 0
            - unit: "s"
            - LSB = :math:`1` s

            **TTR** - *TCP Turn radius*

            - 16 bits [``................``]

            - unsigned quantity
            - scaling factor: 0.01
            - fractional bits: 0
            - unit: "Nm"
            - LSB = :math:`0.01` Nm
            - value :math:`>= 0` Nm
            - value :math:`<= 655.35` Nm

    **COM** - *Communications/ACAS Capability and Flight Status*

        **COM** - *Communications capability of the transponder*

        - 3 bits [``...``]

        - values:

            | 0: No communications capability (surveillance only)
            | 1: Comm. A and Comm. B capability
            | 2: Comm. A, Comm. B and Uplink ELM
            | 3: Comm. A, Comm. B, Uplink ELM and Downlink ELM
            | 4: Level 5 Transponder capability
            | 5: Not assigned
            | 6: Not assigned
            | 7: Not assigned

        **STAT** - *Flight Status*

        - 3 bits [``...``]

        - values:

            | 0: No alert, no SPI, aircraft airborne
            | 1: No alert, no SPI, aircraft on ground
            | 2: Alert, no SPI, aircraft airborne
            | 3: Alert, no SPI, aircraft on ground
            | 4: Alert, SPI, aircraft airborne or on ground
            | 5: No alert, SPI, aircraft airborne or on ground

        ``(spare)``

        - 2 bits [``..``]

        **SSC** - *Specific service capability*

        - 1 bit [``.``]

        - values:

            | 0: No
            | 1: Yes

        **ARC** - *Altitude reporting capability*

        - 1 bit [``.``]

        - values:

            | 0: 100 ft resolution
            | 1: 25 ft resolution

        **AIC** - *Aircraft identification capability*

        - 1 bit [``.``]

        - values:

            | 0: No
            | 1: Yes

        **B1A** - *BDS 1,0 bit 16*

        - 1 bit [``.``]

        - raw value

        **B1B** - *BDS BDS 1,0 bits 37/40*

        - 4 bits [``....``]

        - raw value

    **SAB** - *Status reported by ADS-B*

        **AC**

        - 2 bits [``..``]

        - values:

            | 0: unknown
            | 1: ACAS not operational
            | 2: ACAS operational
            | 3: invalid

        **MN**

        - 2 bits [``..``]

        - values:

            | 0: unknown
            | 1: Multiple navigational aids not operating
            | 2: Multiple navigational aids operating
            | 3: invalid

        **DC**

        - 2 bits [``..``]

        - values:

            | 0: unknown
            | 1: Differential correction
            | 2: No differential correction
            | 3: invalid

        **GBS**

        - 1 bit [``.``]

        - values:

            | 0: Transponder Ground Bit not set or unknown
            | 1: Transponder Ground Bit set

        ``(spare)``

        - 6 bits [``......``]

        **STAT** - *Flight Status*

        - 3 bits [``...``]

        - values:

            | 0: No emergency
            | 1: General emergency
            | 2: Lifeguard / medical
            | 3: Minimum fuel
            | 4: No communications
            | 5: Unlawful interference
            | 6: "Downed" Aircraft
            | 7: Unknown

    **ACS** - *ACAS Resolution Advisory Report*

    Currently active Resolution Advisory (RA), if any, generated by the ACAS associated with the transponder transmitting the report and threat identity data. (MB Data) 56-bit message conveying Mode S Comm B message data of BDS Register 3,0

    - 56 bits [``........................................................``]

    - raw value

    **BVR** - *Barometric Vertical Rate*

    Barometric Vertical Rate in two's complement form

    - 16 bits [``................``]

    - signed quantity
    - scaling factor: 6.25
    - fractional bits: 0
    - unit: "ft/min"
    - LSB = :math:`6.25` ft/min

    **GVR** - *Geometric Vertical Rate*

    Geometric Vertical Rate in two's complement form

    - 16 bits [``................``]

    - signed quantity
    - scaling factor: 6.25
    - fractional bits: 0
    - unit: "ft/min"
    - LSB = :math:`6.25` ft/min

    **RAN** - *Roll Angle*

    Roll Angle in two's complement form

    - 16 bits [``................``]

    - signed quantity
    - scaling factor: 0.01
    - fractional bits: 0
    - unit: "deg"
    - LSB = :math:`0.01` deg
    - value :math:`>= -180` deg
    - value :math:`<= 180` deg

    **TAR** - *Track Angle Rate*

        **TI**

        - 2 bits [``..``]

        - values:

            | 0: Not available
            | 1: Left
            | 2: Right
            | 3: Straight

        ``(spare)``

        - 6 bits [``......``]

        **ROT** - *Rate of Turn in two's complement form*

        - 7 bits [``.......``]

        - signed quantity
        - scaling factor: 1
        - fractional bits: 2
        - unit: "deg/s"
        - LSB = :math:`1 / {2^{2}}` deg/s = :math:`1 / {4}` deg/s :math:`\approx 0.25` deg/s
        - value :math:`>= -15` deg/s
        - value :math:`<= 15` deg/s

        ``(spare)``

        - 1 bit [``.``]

    **TAN** - *Track Angle*

    - 16 bits [``................``]

    - unsigned quantity
    - scaling factor: 360
    - fractional bits: 16
    - unit: "deg"
    - LSB = :math:`360 / {2^{16}}` deg = :math:`360 / {65536}` deg :math:`\approx 0.0054931640625` deg

    **GSP** - *Ground Speed*

    Ground Speed in two's complement form referenced to WGS84

    - 16 bits [``................``]

    - signed quantity
    - scaling factor: 1
    - fractional bits: 14
    - unit: "NM/s"
    - LSB = :math:`1 / {2^{14}}` NM/s = :math:`1 / {16384}` NM/s :math:`\approx 6.103515625e-05` NM/s
    - value :math:`>= -2` NM/s
    - value :math:`< 2` NM/s

    **VUN** - *Velocity Uncertainty*

    - 8 bits [``........``]

    - raw value

    **MET** - *Meteorogical Data*

        **WS** - *Wind Speed Valid Flag*

        - 1 bit [``.``]

        - values:

            | 0: Not valid Wind Speed
            | 1: Valid Wind Speed

        **WD** - *Wind Direction Valid Flag*

        - 1 bit [``.``]

        - values:

            | 0: Not valid Wind Direction
            | 1: Valid Wind Direction

        **TMP** - *Temperature Valid Flag*

        - 1 bit [``.``]

        - values:

            | 0: Not valid Temperature
            | 1: Valid Temperature

        **TRB** - *Turbolence Valid Flag*

        - 1 bit [``.``]

        - values:

            | 0: Not valid Turbulence
            | 1: Valid Turbulence

        ``(spare)``

        - 4 bits [``....``]

        **WS_D** - *Wind Speed*

        - 16 bits [``................``]

        - unsigned quantity
        - scaling factor: 1
        - fractional bits: 0
        - unit: "kt"
        - LSB = :math:`1` kt
        - value :math:`>= 0` kt
        - value :math:`<= 300` kt

        **WD_D** - *Wind Direction*

        - 16 bits [``................``]

        - unsigned quantity
        - scaling factor: 1
        - fractional bits: 0
        - unit: "deg"
        - LSB = :math:`1` deg
        - value :math:`>= 1` deg
        - value :math:`<= 360` deg

        **TMP_D** - *Temperature in degrees celsius*

        - 16 bits [``................``]

        - signed quantity
        - scaling factor: 1
        - fractional bits: 2
        - unit: "degC"
        - LSB = :math:`1 / {2^{2}}` degC = :math:`1 / {4}` degC :math:`\approx 0.25` degC
        - value :math:`>= -100` degC
        - value :math:`<= 100` degC

        **TRB_D** - *Turbulence*

        - 8 bits [``........``]

        - unsigned integer
        - value :math:`>= 0`
        - value :math:`<= 15`

    **EMC** - *Emitter Category*

    - 8 bits [``........``]

    - values:

        | 1: light aircraft =< 7000 kg
        | 2: reserved
        | 3: 7000 kg < medium aircraft < 136000 kg
        | 4: reserved
        | 5: 136000 kg =< heavy aircraft
        | 6: highly manoeuvrable (5g acceleration capability) and high speed (>400 knots cruise)
        | 7: reserved
        | 8: reserved
        | 9: reserved
        | 10: rotocraft
        | 11: glider / sailplane
        | 12: lighter-than-air
        | 13: unmanned aerial vehicle
        | 14: space / transatmospheric vehicle
        | 15: ultralight / handglider / paraglider
        | 16: parachutist / skydiver
        | 17: reserved
        | 18: reserved
        | 19: reserved
        | 20: surface emergency vehicle
        | 21: surface service vehicle
        | 22: item ground or tethered obstruction
        | 23: reserved
        | 24: reserved

    **POS** - *Position*

        **Latitude** - *In WGS.84 in two's complement form.*

        - 24 bits [``........................``]

        - signed quantity
        - scaling factor: 180
        - fractional bits: 23
        - unit: "deg"
        - LSB = :math:`180 / {2^{23}}` deg = :math:`180 / {8388608}` deg :math:`\approx 2.1457672119140625e-05` deg
        - value :math:`>= -90` deg
        - value :math:`<= 90` deg

        **Longitude** - *In WGS.84 in two's complement form.*

        - 24 bits [``........................``]

        - signed quantity
        - scaling factor: 180
        - fractional bits: 23
        - unit: "deg"
        - LSB = :math:`180 / {2^{23}}` deg = :math:`180 / {8388608}` deg :math:`\approx 2.1457672119140625e-05` deg
        - value :math:`>= -180` deg
        - value :math:`< 180` deg

        remark
            This corresponds to a resolution of at least 2.4 meters.

    **GAL** - *Geometric Altitude*

    - 16 bits [``................``]

    - signed quantity
    - scaling factor: 6.25
    - fractional bits: 0
    - unit: "ft"
    - LSB = :math:`6.25` ft
    - value :math:`>= -1500` ft
    - value :math:`<= 150000` ft

    **PUN** - *Position Uncertainty*

        ``(spare)``

        - 4 bits [``....``]

        **PUN** - *Position Uncertainty*

        - 4 bits [``....``]

        - raw value

    **MB** - *MODE S MB DATA*

    Repetitive item, repetition factor 8 bits.

            **MBdata** - *56 bit message conveying Mode S B message data*

            - 56 bits [``........................................................``]

            - raw value

            **BDS1** - *Comm B data Buffer Store 1 Address*

            - 4 bits [``....``]

            - raw value

            **BDS2** - *Comm B data Buffer Store 2 Address*

            - 4 bits [``....``]

            - raw value

    **IAR** - *Indicated Airspeed*

    - 16 bits [``................``]

    - signed quantity
    - scaling factor: 1
    - fractional bits: 0
    - unit: "kt"
    - LSB = :math:`1` kt
    - value :math:`>= 0` kt
    - value :math:`<= 1100` kt

    **MAC** - *Mach Number*

    - 16 bits [``................``]

    - signed quantity
    - scaling factor: 0.008
    - fractional bits: 0
    - unit: "Mach"
    - LSB = :math:`0.008` Mach
    - value :math:`>= 0` Mach
    - value :math:`<= 4.096` Mach

    **BPS** - *Barometric Pressure Setting (derived from Mode S BDS 4,0)*

        ``(spare)``

        - 4 bits [``....``]

        **BPS**

        - 12 bits [``............``]

        - unsigned quantity
        - scaling factor: 0.1
        - fractional bits: 0
        - unit: "mb"
        - LSB = :math:`0.1` mb
        - value :math:`>= 0` mb
        - value :math:`<= 409.5` mb


Notes:

    1. NC is set to one when the aircraft will not fly the path described
       by the TCP data.
    2. TCP numbers start from zero.
    3. LT = Lateral Type
    4. VT = Vertical Type
    5. TOV gives the estimated time before reaching the point. It is
       defined as the absolute time from midnight.
    6. TOV is meaningful only if TOA is set to 0
    7. Refer to ICAO Draft SARPs for ACAS for detailed explanations.
    8. A positive value represents a right turn, whereas a negative value
       represents a left turn.
    9. Value 15 means 15 degrees/s or above.
    10. Velocity uncertainty category of the least accurate velocity component
    11. Positive longitude indicates East. Positive latitude indicates North.
    12. LSB is required to be thinner than 10 ft by ICAO
    13. Only DAPs that can not be encoded into other subfields of this item
        should be sent using subfield #25
    14. BPS is the barometric pressure setting of the aircraft minus 800 mb.

I062/390 - Flight Plan Related Data
***********************************

*Definition*: All flight plan related information, provided by ground-based systems.

*Structure*:

Compound item (FX)

    **TAG** - *FPPS Identification Tag*

        **SAC** - *System Area Code*

        - 8 bits [``........``]

        - raw value

        **SIC** - *System Identification code*

        - 8 bits [``........``]

        - raw value

    **CSN** - *Callsign*

    - 56 bits [``........................................................``]

    - Ascii string (8-bits per character)

    **IFI** - *IFPS_FLIGHT_ID*

        **TYP**

        - 2 bits [``..``]

        - values:

            | 0: Plan Number
            | 1: Unit 1 internal flight number
            | 2: Unit 2 internal flight number
            | 3: Unit 3 internal flight number

        ``(spare)``

        - 3 bits [``...``]

        **NBR** - *Number from 0 to 99 999 999*

        - 27 bits [``...........................``]

        - unsigned integer
        - value :math:`>= 0`
        - value :math:`<= 99999999`

    **FCT** - *Flight Category*

        **GATOAT**

        - 2 bits [``..``]

        - values:

            | 0: Unknown
            | 1: General Air Traffic
            | 2: Operational Air Traffic
            | 3: Not applicable

        **FR1FR2**

        - 2 bits [``..``]

        - values:

            | 0: Instrument Flight Rules
            | 1: Visual Flight Rules
            | 2: Not applicable
            | 3: Controlled Visual Flight Rules

        **RVSM**

        - 2 bits [``..``]

        - values:

            | 0: Unknown
            | 1: Approved
            | 2: Exempt
            | 3: Not Approved

        **HPR**

        - 1 bit [``.``]

        - values:

            | 0: Normal Priority Flight
            | 1: High Priority Flight

        ``(spare)``

        - 1 bit [``.``]

    **TAC** - *Type of Aircraft*

    - 32 bits [``................................``]

    - Ascii string (8-bits per character)

    **WTC** - *Wake Turbulence Category*

    - 8 bits [``........``]

    - Ascii string (8-bits per character)

    **DEP** - *Departure Airport*

    - 32 bits [``................................``]

    - Ascii string (8-bits per character)

    **DST** - *Destination Airport*

    - 32 bits [``................................``]

    - Ascii string (8-bits per character)

    **RDS** - *Runway Designation*

        **NU1** - *First number*

        - 8 bits [``........``]

        - raw value

        **NU2** - *Second number*

        - 8 bits [``........``]

        - raw value

        **LTR** - *Letter*

        - 8 bits [``........``]

        - Ascii string (8-bits per character)

    **CFL** - *Current Cleared Flight Level*

    - 16 bits [``................``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "FL"
    - LSB = :math:`1 / {2^{2}}` FL = :math:`1 / {4}` FL :math:`\approx 0.25` FL

    **CTL** - *Current Control Position*

        **Centre** - *8-bit group Identification code*

        - 8 bits [``........``]

        - raw value

        **Position** - *8-bit Control Position identification code*

        - 8 bits [``........``]

        - raw value

    **TOD** - *Time of Departure / Arrival*

    Repetitive item, repetition factor 8 bits.

            **TYP**

            - 5 bits [``.....``]

            - values:

                | 0: Scheduled off-block time
                | 1: Estimated off-block time
                | 2: Estimated take-off time
                | 3: Actual off-block time
                | 4: Predicted time at runway hold
                | 5: Actual time at runway hold
                | 6: Actual line-up time
                | 7: Actual take-off time
                | 8: Estimated time of arrival
                | 9: Predicted landing time
                | 10: Actual landing time
                | 11: Actual time off runway
                | 12: Predicted time to gate
                | 13: Actual on-block time

            **DAY**

            - 2 bits [``..``]

            - values:

                | 0: Today
                | 1: Yesterday
                | 2: Tomorrow
                | 3: Invalid

            ``(spare)``

            - 4 bits [``....``]

            **HOR** - *Hours*

            - 5 bits [``.....``]

            - unsigned integer
            - value :math:`>= 0`
            - value :math:`<= 23`

            ``(spare)``

            - 2 bits [``..``]

            **MIN** - *Minutes*

            - 6 bits [``......``]

            - unsigned integer
            - value :math:`>= 0`
            - value :math:`<= 59`

            **AVS** - *Seconds Available Flag*

            - 1 bit [``.``]

            - values:

                | 0: Seconds available
                | 1: Seconds not available

            ``(spare)``

            - 1 bit [``.``]

            **SEC** - *Seconds*

            - 6 bits [``......``]

            - unsigned integer
            - value :math:`>= 0`
            - value :math:`<= 59`

    **AST** - *Aircraft Stand*

    - 48 bits [``................................................``]

    - Ascii string (8-bits per character)

    **STS** - *Stand Status*

        **EMP**

        - 2 bits [``..``]

        - values:

            | 0: Empty
            | 1: Occupied
            | 2: Unknown
            | 3: Invalid

        **AVL**

        - 2 bits [``..``]

        - values:

            | 0: Available
            | 1: Not available
            | 2: Unknown
            | 3: Invalid

        ``(spare)``

        - 4 bits [``....``]

    **STD** - *Standard Instrument Departure*

    - 56 bits [``........................................................``]

    - Ascii string (8-bits per character)

    **STA** - *Standard Instrument Arrival*

    - 56 bits [``........................................................``]

    - Ascii string (8-bits per character)

    **PEM** - *Pre-Emergency Mode 3/A*

        ``(spare)``

        - 3 bits [``...``]

        **VA**

        - 1 bit [``.``]

        - values:

            | 0: No valid Mode 3/A available
            | 1: Valid Mode 3/A available

        **ABCD** - *Mode-3/A reply in octal representation*

        - 12 bits [``............``]

        - raw value

    **PEC** - *Pre-Emergency Callsign*

    - 56 bits [``........................................................``]

    - Ascii string (8-bits per character)


Notes:

    1. The up-to-date list of SACs is published on the Eurocontrol Web Site
       (http://www.eurocontrol.int).
    2. Each one of the seven Octets contains an ASCII Character.
       TheCallsign is always left adjusted. It contains up to seven
       upper-case alphanumeric characters, the remaining character
       positions (if any)are padded with space characters.
    3. Each one of the four Octets composing the type of an aircraft
       contains an ASCII Character (upper-case alphanumeric characters
       with trailing spaces).
    4. The types of aircraft are defined in [Ref.4]
    5. Each one of the four Octets composing the name of an airport
       contains an ASCII Character (upper case alphabetic).
    6. The Airport Names are indicated in the ICAO Location Indicators book.
    7. Each one of the four Octets composing the name of an airport
       contains an ASCII Character (upper case alphabetic).
    8. The Airport Names are indicated in the ICAO Location Indicators book.
    9. NU1, NU2 and LTR each contain an ASCII character
    10. For details refer to.[5] Section 5
    11. The centre and the control position identification codes have to be
        defined between communication partners.
    12. Estimated times are derived from flight plan systems. Predicted
        times are derived by the fusion system, based on surveillance
        data. For definitions, see [Ref.4]
    13. Each one of the six Octets contains an ASCII Character. The Aircraft
        Stand identification is always left adjusted. It contains up
        to six upper-case alphanumeric characters, the remaining character
        positions (if any) are padded with space characters.
    14. Each one of the seven Octets contains an ASCII Character.
        The SID is always left adjusted. It contains up to seven
        alphanumeric characters, the remaining character positions
        (if any) are padded with space characters.
    15. Each one of the seven Octets contains an ASCII Character.
        The STAR is always left adjusted. It contains up to seven
        alphanumeric characters, the remaining character positions
        (if any) are padded with space characters.
    16. This subfield is used only when the aircraft is transmitting
        an emergency Mode 3/A code
    17. If VA = 0, the content of bits 12/1 is meaningless
    18. Each one of the seven Octets contains an ASCII Character.
        The Callsign is always left adjusted. It contains up to seven
        upper-case alphanumeric characters, the remaining character
        positions (if any) are padded with space characters
    19. This subfield is used only when an emergency Mode 3/A is associated
        with the track (I062/390 Subfield #17)

I062/500 - Estimated Accuracies
*******************************

*Definition*: Overview of all important accuracies

*Structure*:

Compound item (FX)

    **APC** - *Estimated Accuracy Of Track Position (Cartesian)*

        **X** - *APC (X-Component)*

        - 16 bits [``................``]

        - unsigned quantity
        - scaling factor: 1
        - fractional bits: 1
        - unit: "m"
        - LSB = :math:`1 / {2^{1}}` m = :math:`1 / {2}` m :math:`\approx 0.5` m

        **Y** - *APC (Y-Component)*

        - 16 bits [``................``]

        - unsigned quantity
        - scaling factor: 1
        - fractional bits: 1
        - unit: "m"
        - LSB = :math:`1 / {2^{1}}` m = :math:`1 / {2}` m :math:`\approx 0.5` m

    **COV** - *XY covariance component*

    - 16 bits [``................``]

    - signed quantity
    - scaling factor: 1
    - fractional bits: 1
    - unit: "m"
    - LSB = :math:`1 / {2^{1}}` m = :math:`1 / {2}` m :math:`\approx 0.5` m

    **APW** - *Estimated Accuracy Of Track Position (WGS-84)*

        **X** - *APW (Latitude Component)*

        - 16 bits [``................``]

        - unsigned quantity
        - scaling factor: 180
        - fractional bits: 25
        - unit: "deg"
        - LSB = :math:`180 / {2^{25}}` deg = :math:`180 / {33554432}` deg :math:`\approx 5.364418029785156e-06` deg

        **Y** - *APW (Longitude Component)*

        - 16 bits [``................``]

        - unsigned quantity
        - scaling factor: 180
        - fractional bits: 25
        - unit: "deg"
        - LSB = :math:`180 / {2^{25}}` deg = :math:`180 / {33554432}` deg :math:`\approx 5.364418029785156e-06` deg

    **AGA** - *Estimated Accuracy Of Calculated Track Geometric Altitude*

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 6.25
    - fractional bits: 0
    - unit: "ft"
    - LSB = :math:`6.25` ft

    **ABA** - *Estimated Accuracy Of Calculated Track Barometric Altitude*

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 1
    - fractional bits: 2
    - unit: "FL"
    - LSB = :math:`1 / {2^{2}}` FL = :math:`1 / {4}` FL :math:`\approx 0.25` FL

    **ATW** - *Estimated Accuracy Of Track Velocity (Cartesian)*

        **ATVX** - *ATV (X-Component)*

        - 8 bits [``........``]

        - unsigned quantity
        - scaling factor: 1
        - fractional bits: 2
        - unit: "m/s"
        - LSB = :math:`1 / {2^{2}}` m/s = :math:`1 / {4}` m/s :math:`\approx 0.25` m/s

        **ATVY** - *ATV (Y-Component)*

        - 8 bits [``........``]

        - unsigned quantity
        - scaling factor: 1
        - fractional bits: 2
        - unit: "m/s"
        - LSB = :math:`1 / {2^{2}}` m/s = :math:`1 / {4}` m/s :math:`\approx 0.25` m/s

    **AA** - *Estimated Accuracy Of Acceleration (Cartesian)*

        **AAX** - *AA (X-Component)*

        - 8 bits [``........``]

        - unsigned quantity
        - scaling factor: 1
        - fractional bits: 2
        - unit: "m/s2"
        - LSB = :math:`1 / {2^{2}}` m/s2 = :math:`1 / {4}` m/s2 :math:`\approx 0.25` m/s2

        **AAY** - *AA (Y-Component)*

        - 8 bits [``........``]

        - unsigned quantity
        - scaling factor: 1
        - fractional bits: 2
        - unit: "m/s2"
        - LSB = :math:`1 / {2^{2}}` m/s2 = :math:`1 / {4}` m/s2 :math:`\approx 0.25` m/s2

    **ARC** - *Estimated Accuracy Of Rate Of Climb/Descent*

    - 8 bits [``........``]

    - unsigned quantity
    - scaling factor: 6.25
    - fractional bits: 0
    - unit: "ft/min"
    - LSB = :math:`6.25` ft/min


Notes:

    1. Maximum value means maximum value or above.
    2. XY covariance component = sign {Cov(X,Y)} * sqrt {abs [Cov (X,Y)]}
    3. The maximum value for the (unsigned) XY covariance component is 16.383 km
    4. Maximum value means maximum value or above.
    5. Maximum value means maximum value or above.
    6. Maximum value means maximum value or above.
    7. Maximum value means maximum value or above.
    8. Maximum value means maximum value or above.
    9. Maximum value means maximum value or above.

I062/510 - Track Status
***********************

*Definition*: Identification of a system track

*Structure*:

Extended item with first part ``24 bits`` long and optional ``24 bits`` extends.

    **MIDENT** - *MASTER SYSTEM UNIT IDENTIFICATION*

    - 8 bits [``........``]

    - raw value

    **MTRACK** - *MASTER SYSTEM TRACK NUMBER*

    - 15 bits [``...............``]

    - raw value

    ``(FX)``

    - extension bit

        | 0: End of data item
        | 1: Extension into next extent

    **SIDENT** - *SLAVE SYSTEM UNIT IDENTIFICATION*

    - 8 bits [``........``]

    - raw value

    **STRACK** - *SLAVE SYSTEM TRACK NUMBER*

    - 15 bits [``...............``]

    - raw value

    ``(FX)``

    - extension bit

        | 0: End of data item
        | 1: Extension into next extent


Notes:

    - The composed track number is used by co-operating units to uniquely
      identify a track. It consists of the unit identifier and system
      track number for each unit involved in the co-operation. The first
      unit identification identifies the unit that is responsible for the
      track amalgamation.

I062/RE - Reserved Expansion Field
**********************************

*Definition*: Expansion

*Structure*:

Explicit item



I062/SP - Special Purpose Field
*******************************

*Definition*: Special Purpose Field

*Structure*:

Explicit item


User Application Profile for Category 062
=========================================
- (1) ``I062/010`` - Data Source Identifier
- (2) ``(spare)``
- (3) ``I062/015`` - Service Identification
- (4) ``I062/070`` - Time Of Track Information
- (5) ``I062/105`` - Calculated Position In WGS-84 Co-ordinates
- (6) ``I062/100`` - Calculated Track Position
- (7) ``I062/185`` - Calculated Track Velocity (Cartesian)
- ``(FX)`` - Field extension indicator
- (8) ``I062/210`` - Calculated Acceleration (Cartesian)
- (9) ``I062/060`` - Track Mode 3/A Code
- (10) ``I062/245`` - Target Identification
- (11) ``I062/380`` - Aircraft Derived Data
- (12) ``I062/040`` - Track Number
- (13) ``I062/080`` - Track Status
- (14) ``I062/290`` - System Track Update Ages
- ``(FX)`` - Field extension indicator
- (15) ``I062/200`` - Mode of Movement
- (16) ``I062/295`` - Track Data Ages
- (17) ``I062/136`` - Measured Flight Level
- (18) ``I062/130`` - Calculated Track Geometric Altitude
- (19) ``I062/135`` - Calculated Track Barometric Altitude
- (20) ``I062/220`` - Calculated Rate Of Climb/Descent
- (21) ``I062/390`` - Flight Plan Related Data
- ``(FX)`` - Field extension indicator
- (22) ``I062/270`` - Target Size & Orientation
- (23) ``I062/300`` - Vehicle Fleet Identification
- (24) ``I062/110`` - Mode 5 Data reports & Extended Mode 1 Code
- (25) ``I062/120`` - Track Mode 2 Code
- (26) ``I062/510`` - Track Status
- (27) ``I062/500`` - Estimated Accuracies
- (28) ``I062/340`` - Measured Information
- ``(FX)`` - Field extension indicator
- (29) ``(spare)``
- (30) ``(spare)``
- (31) ``(spare)``
- (32) ``(spare)``
- (33) ``(spare)``
- (34) ``I062/RE`` - Reserved Expansion Field
- (35) ``I062/SP`` - Special Purpose Field
- ``(FX)`` - Field extension indicator

