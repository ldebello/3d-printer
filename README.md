# 3D printer designs

OpenSCAD sources for FDM-friendly models. This repo keeps **only `.scad` sources** — no STL/3MF binaries. Export meshes locally or with an online tool, then slice in your own slicer.

## Bingo control board

A numbered tray for bingo balls: **90 pockets** (10×9), shallow lip so balls stay on the board, engraved title **BINGO EN CASA** on the front strip.

- Source: [`scad/bingo_control_board.scad`](scad/bingo_control_board.scad) — all dimensions and labels are explained in comments at the top of the file.
- MakerWorld: [Bingo control board](https://makerworld.com/en/models/2549527-bingo-control-board#profileId-2807709)

## Floating base for solar fountain

A floating ring base that keeps small solar fountains centered and stable in pools, bird baths, or garden water features, helping prevent splashing outside the water.

- Source: [`scad/floating_base_for_solar_fountain.scad`](scad/floating_base_for_solar_fountain.scad)
- MakerWorld: [Floating base for solar fountain](https://makerworld.com/en/models/2579805-floating-base-for-solar-fountain#profileId-2845158)
- Designed around this fountain size: [Temu reference model](https://www.temu.com/br/goods.html?_bg_fs=1&goods_id=601103652294718)
- Print note: the model is split in half for bed-size limits; print **2 halves** and glue them together.
- Optional: add silicone on the seam for better durability and water resistance.
- No supports required in most typical setups.

## Tender cap

A thin-walled rectangular cap: internal cavity **~20.4×10.2 mm** (nominal footprint plus clearance), **30 mm** tall walls, **1 mm** walls and **2 mm** floor — useful as a slip-on cover for small rectangular parts.

- Source: [`scad/tender_cap.scad`](scad/tender_cap.scad) — dimensions, wall/floor thickness, and clearance are parameters at the top of the file.

### Preview in the browser

**[OpenSCAD Playground](https://ochafik.com/openscad2/)** — paste or open the `.scad` file to render and try parameter changes without installing OpenSCAD.

### Export to STL / 3MF / other formats

Use a converter such as **[ImageToStl](https://imagetostl.com/es)** (or any SCAD/OpenSCAD-to-mesh workflow you prefer): upload the `.scad`, choose the output format, download the mesh, then slice wherever you like.

### Print check

Sliced and test-printed with **Bambu Studio** on a **Bambu Lab A1**; your machine and profiles may differ.

---

*Add new designs under `scad/`; generate meshes on your machine and keep them out of git if you prefer a source-only repo.*
