*BSIM-CMG inverter

.control
pre_osdi .\models\bsimcmg\bsimcmg.osdi
.endc


*------------------------------------------------
* NFET wrapper
*------------------------------------------------

.subckt asap_7nm_nfet S G D B l=7e-009 nfin=1
    nnmos_finfet S G D B BSIMCMG_osdi_N l={l} nfin={nfin}
.ends asap_7nm_nfet

.subckt asap_7nm_pfet S G D B l=7e-009 nfin=1
    npmos_finfet S G D B BSIMCMG_osdi_P l ={l} nfin={nfin}
.ends asap_7nm_pfet 

*------------------------------------------------
* BSIM-CMG model
*------------------------------------------------

.model BSIMCMG_osdi_N BSIMCMG_va (
+ TYPE = 1
+ version = 107
+ bulkmod = 1
+ igcmod = 1
+ igbmod = 0
+ gidlmod = 1
+ iimod = 0
+ geomod = 1
+ rdsmod = 0
+ rgatemod = 0
+ rgeomod = 0
+ shmod = 0
+ nqsmod = 0
+ coremod = 0
+ cgeomod = 0
+ capmod = 0
+ tnom = 25
+ eot = 1e-009
+ eotbox = 1.4e-007
+ eotacc = 1e-010
+ tfin = 6.5e-009
+ toxp = 2.1e-009
+ nbody = 1e+022
+ phig = 4.2466
+ epsrox = 3.9
+ epsrsub = 11.9
+ easub = 4.05
+ ni0sub = 1.1e+016
+ bg0sub = 1.17
+ nc0sub = 2.86e+025
+ nsd = 2e+026
+ ngate = 0
+ nseg = 5
+ l = 2.1e-008
+ xl = 1e-009
+ lint = -2e-009
+ dlc = 0
+ dlbin = 0
+ hfin = 3.2e-008
+ deltaw = 0
+ deltawcv = 0
+ sdterm = 0
+ epsrsp = 3.9
+ nfin = 1
+ toxg = 1.80e-009

* DC parameters
+ cit = 0
+ cdsc = 0.01
+ cdscd = 0.01
+ dvt0 = 0.05
+ dvt1 = 0.47
+ phin = 0.05
+ eta0 = 0.07
+ dsub = 0.35
+ k1rsce = 0
+ lpe0 = 0
+ dvtshift = 0
+ qmfactor = 2.5
+ etaqm = 0.54
+ qm0 = 0.001
+ pqm = 0.66
+ u0 = 0.0303
+ etamob = 2
+ up = 0
+ ua = 0.55
+ eu = 1.2
+ ud = 0
+ ucs = 1
+ rdswmin = 0
+ rdsw = 200
+ wr = 1
+ rswmin = 0
+ rdwmin = 0
+ rshs = 0
+ rshd = 0
+ vsat = 70000
+ deltavsat = 0.2
+ ksativ = 2
+ mexp = 4
+ ptwg = 30
+ pclm = 0.01
+ pclmg = 1
+ pdibl1 = 800
+ pdibl2 = 0.005704
+ drout = 4.97
+ pvag = 200
+ fpitch = 2.7e-008
+ rth0 = 0.15
+ cth0 = 1.243e-006
+ wth0 = 2.6e-007

* Leakage
+ aigc = 0.007
+ bigc = 0.0015
+ cigc = 1
+ dlcigs = 5e-009
+ dlcigd = 5e-009
+ aigs = 0.006
+ aigd = 0.006
+ bigs = 0.001944
+ bigd = 0.001944
+ cigs = 1
+ cigd = 1
+ poxedge = 1.152
+ agidl = 2e-012
+ agisl = 2e-012
+ bgidl = 1.5e+008
+ bgisl = 1.5e+008
+ egidl = 1.142
+ egisl = 1.142

* Capacitance
+ cfs = 0
+ cfd = 0
+ cgso = 1.6e-010
+ cgdo = 1.6e-010
+ cgsl = 0
+ cgdl = 0
+ ckappas = 0.6
+ ckappad = 0.6
+ cgbo = 0
+ cgbl = 0

* Temperature
+ tbgasub = 0.000473
+ tbgbsub = 636
+ kt1 = 0
+ kt1l = 0
+ ute = -1.2
+ utl = 0
+ ua1 = 0.001032
+ ud1 = 0
+ ucste = -0.004775
+ at = 0.001
+ ptwgt = 0.004
+ tmexp = 0
+ prt = 0
+ tgidl = -0.007
+ igt = 2.5
)

.model BSIMCMG_osdi_P BSIMCMG_va (
+ TYPE = -1
+ version = 107
+ bulkmod = 1
+ igcmod = 1
+ igbmod = 0
+ gidlmod = 1
+ iimod = 0
+ geomod = 1
+ rdsmod = 0
+ rgatemod = 0
+ rgeomod = 0
+ shmod = 0
+ nqsmod = 0
+ coremod = 0
+ cgeomod = 0
+ capmod = 0
+ tnom = 25

* Geometry / electrostatics
+ eot = 1e-009
+ eotbox = 1.4e-007
+ eotacc = 3e-010
+ tfin = 6.5e-009
+ toxp = 2.1e-009
+ nbody = 1e+022
+ phig = 4.9278
+ epsrox = 3.9
+ epsrsub = 11.9
+ easub = 4.05
+ ni0sub = 1.1e+016
+ bg0sub = 1.17
+ nc0sub = 2.86e+025
+ nsd = 2e+026
+ ngate = 0
+ nseg = 5

* Channel / length
+ l = 2.1e-008
+ xl = 1e-009
+ lint = -2.5e-009
+ dlc = 0
+ dlbin = 0
+ hfin = 3.2e-008
+ deltaw = 0
+ deltawcv = 0
+ sdterm = 0
+ epsrsp = 3.9
+ nfin = 1
+ toxg = 1.8e-009

* DC parameters
+ cit = 0
+ cdsc = 0.003469
+ cdscd = 0.001486
+ dvt0 = 0.05
+ dvt1 = 0.36
+ phin = 0.05
+ eta0 = 0.094
+ dsub = 0.24
+ k1rsce = 0
+ lpe0 = 0
+ dvtshift = 0
+ qmfactor = 0
+ etaqm = 0.54
+ qm0 = 2.183e-012
+ pqm = 0.66

* Mobility
+ u0 = 0.0237
+ etamob = 4
+ up = 1
+ ua = 1.133
+ eu = 0.05
+ ud = 0.0105
+ ucs = 0.2672

* Resistance
+ rdswmin = 0
+ rdsw = 200
+ wr = 1
+ rswmin = 0
+ rdwmin = 0
+ rshs = 0
+ rshd = 0

* Velocity saturation / output
+ vsat = 60000
+ deltavsat = 0.17
+ ksativ = 1.592
+ mexp = 2.491
+ ptwg = 25
+ pclm = 0.01
+ pclmg = 1
+ pdibl1 = 800
+ pdibl2 = 0.005704
+ drout = 4.97
+ pvag = 200
+ fpitch = 2.7e-008

* Self heating
+ rth0 = 0.15
+ cth0 = 1.243e-006
+ wth0 = 2.6e-007

* Length dependence
+ lcdscd = 0
+ lcdscdr = 0
+ lrdsw = 1.3
+ lvsat = 1441

* Gate leakage
+ aigc = 0.007
+ bigc = 0.0015
+ cigc = 1
+ dlcigs = 5e-009
+ dlcigd = 5e-009
+ aigs = 0.006
+ aigd = 0.006
+ bigs = 0.001944
+ bigd = 0.001944
+ cigs = 1
+ cigd = 1
+ poxedge = 1.152

* GIDL / GISL
+ agidl = 2e-012
+ agisl = 2e-012
+ bgidl = 1.5e+008
+ bgisl = 1.5e+008
+ egidl = 1.142
+ egisl = 1.142

* Capacitance
+ cfs = 0
+ cfd = 0
+ cgso = 1.6e-010
+ cgdo = 1.6e-010
+ cgsl = 0
+ cgdl = 0
+ ckappas = 0.6
+ ckappad = 0.6
+ cgbo = 0
+ cgbl = 0

* Temperature
+ tbgasub = 0.000473
+ tbgbsub = 636
+ kt1 = 0
+ kt1l = 0
+ ute = -1.2
+ utl = 0
+ ua1 = 0.001032
+ ud1 = 0
+ ucste = -0.004775
+ at = 0.001
+ ptwgt = 0.004
+ tmexp = 0
+ prt = 0
+ tgidl = -0.007
+ igt = 2.5
)

*------------------------------------------------
* Test circuit
*------------------------------------------------


VDD vdd 0 0.7
VIN in 0 0 

Xnfet2 0 in inv_out 0 asap_7nm_nfet l=7e-009 nfin=1
Xpfet2 vdd in inv_out vdd asap_7nm_pfet l=7e-009 nfin=1

.control

dc VIN 0 0.7 1m

let diff = abs(v(inv_out) - v(in))

let order = sortorder(diff)
let min_index = order[0]

let VM = v(in)[min_index]
let VOUT_VM = v(inv_out)[min_index]

print min_index
print VM
print VOUT_VM
print diff[min_index]

* VTC data
let vin_v = v(in)
let vout_v = v(inv_out)

* Switching volt.
* Vout = vin

let min_diff = minimum(diff)
let vm = vin_v[min_index]
let vout_vm = vout_v[min_index]

echo ----------------------------------------
echo Switching Voltage Vm
echo ----------------------------------------
print min_index
print vm
print vout_vm
print min_diff


* Voltage Gain
*--------------------------------------------------------
let gain = deriv(vout_v)

let max_gain = abs(minimum(gain))

echo ----------------------------------------
echo Maximum Voltage Gain
echo ----------------------------------------

print max_gain


*----------------------------------------------------
* Find VIL and VIH
* Points where dVout/dVin crosses -1
*--------------------------------------------------------

let slope = deriv(vout_v)
let err = slope + 1

let vil = 0
let vih = 0
let found = 0

let i = 0

while i < 700

    let e1 = err[i]
    let e2 = err[i+1]

    if (e1*e2 <= 0)

        let x1 = vin_v[i]
        let x2 = vin_v[i+1]

        let vcross = x1 + (-e1/(e2-e1))*(x2-x1)

        if found = 0
            let vil = vcross
            let found = 1
        else
            let vih = vcross
        end

    end

    let i = i + 1

end

print vil
print vih

plot v(inv_out)

.endc

.end