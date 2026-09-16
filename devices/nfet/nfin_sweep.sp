* BSIM-CMG NFET test

.control
pre_osdi .\models\bsimcmg\bsimcmg.osdi
.endc

*------------------------------------------------
* NFET wrapper
*------------------------------------------------

.subckt asap_7nm_nfet S G D B l=7e-009 nfin=1
    nnmos_finfet S G D B BSIMCMG_osdi_N l={l} nfin={nfin}
.ends asap_7nm_nfet

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

*------------------------------------------------
* Test circuit
*------------------------------------------------

VDS nfet_out 0 0.7
VGS nfet_in 0 0

Xnfet2 nfet_out nfet_in 0 0 asap_7nm_nfet l=7e-009 nfin=14

.control

dc VGS 0 0.7 1m
let id = -I(VDS) 

wrdata nfin_14.dat id

plot id

.endc

.end