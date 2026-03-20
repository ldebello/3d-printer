# 3D printer designs

OpenSCAD sources for FDM-friendly models. This repo keeps **only `.scad` sources** — no STL/3MF binaries. Export meshes locally or with an online tool, then slice in your own slicer.

## Bingo control board

A numbered tray for bingo balls: **90 pockets** (10×9), shallow lip so balls stay on the board, engraved title **BINGO EN CASA** on the front strip.

- Source: [`scad/bingo_control_board.scad`](scad/bingo_control_board.scad) — all dimensions and labels are explained in comments at the top of the file.

### Preview in the browser

**[OpenSCAD Playground](https://ochafik.com/openscad2/)** — paste or open the `.scad` file to render and try parameter changes without installing OpenSCAD.

### Export to STL / 3MF / other formats

Use a converter such as **[ImageToStl](https://imagetostl.com/es)** (or any SCAD/OpenSCAD-to-mesh workflow you prefer): upload the `.scad`, choose the output format, download the mesh, then slice wherever you like.

### Print check

Sliced and test-printed with **Bambu Studio** on a **Bambu Lab A1**; your machine and profiles may differ.

---

*Add new designs under `scad/`; generate meshes on your machine and keep them out of git if you prefer a source-only repo.*
