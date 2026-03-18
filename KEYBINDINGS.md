# Neovim Keybinding Analysis

## Summary

This document categorizes all keybindings in your Neovim config and identifies conflicts/redundancies.

---

## Collisions & Conflicts Found

### Critical Conflicts

| Keybinding | Defined In | Conflict With | Issue |
|------------|------------|---------------|-------|
| `gd` | Telescope (init.lua:441) | Snacks (snacks.lua:354) | Both define LSP goto definitions |
| `gr` | Telescope (init.lua:432) | Snacks (snacks.lua:368) | Both define LSP references - Snacks has `nowait=true` which overrides |
| `<leader>/` | Telescope (init.lua:459) | Snacks (snacks.lua:66) | Both define grep in current buffer - Snacks will override |
| `<leader>sg` | Telescope (init.lua:417) | Snacks (snacks.lua:199) | Duplicate "Grep" binding |
| `<leader>sc` | Telescope (init.lua:421) | Snacks (snacks.lua:235) | Duplicate "Command History" |
| `<leader>sq` | Snacks (snacks.lua:326) | Which-key `s` group | Quickfix list defined in both |
| `gI` | Telescope (init.lua:436) | Snacks (snacks.lua:376) | Duplicate "Goto Implementation" |
| `gy` | Telescope (init.lua:454) | Snacks (snacks.lua:383) | Duplicate "Goto Type Definition" |

### Redundant Bindings

| Keybinding | Duplicates | Recommendation |
|------------|------------|----------------|
| `<C-h/j/k/l>` | `<A-h/j/k/l>` | Alt+arrows are redundant since you have Ctrl+arrows |
| `<leader>,` | `<leader>fb`, `<leader><leader>` | All 3 open buffers - keep one |
| `<leader>:` | `<leader>sc` | Both open command history |
| `<leader>sd` | `<leader>sD` | Both open diagnostics (buffer vs all) - could consolidate |

---

## Keybinding Categories

### 1. Default Neovim Keybindings (Preserve)

These are built-in and should be kept:

| Key | Default Action |
|-----|----------------|
| `Esc` | Exit insert mode / Clear search highlight (remapped) |
| `Ctrl+d` | Half-page down |
| `Ctrl+u` | Half-page up |
| `Ctrl+w h/j/k/l` | Window navigation |
| `n/N` | Next/prev search result |
| `J` | Join lines |
| `Ctrl+\ Ctrl+n` | Exit terminal mode |
| `]c / [c` | Next/prev git change (gitsigns) |

---

### 2. Custom Keymaps (lua/custom/keymaps.lua)

| Key | Mode | Action | Notes |
|-----|------|--------|-------|
| `<leader>pv` | n | Open Netrw | Good for file explorer |
| `J` | v | Move line down | Enhanced from default |
| `K` | v | Move line up | Enhanced from default |
| `J` | n | Join with cursor preservation | |
| `<C-d>` | n | Half-page down + center | Enhanced |
| `<C-u>` | n | Half-page up + center | Enhanced |
| `n` | n | Search next + center | Enhanced |
| `N` | n | Search prev + center | Enhanced |
| `=ap` | n | Auto-indent paragraph | Useful |
| `<leader>p` | x | Paste without yanking | Very useful |
| `<leader>y` | n/v | Yank to system clipboard | |
| `<leader>Y` | n | Yank line to clipboard | |
| `<leader>d` | n/v | Delete without yanking | |
| `<leader>k` | n | Next location list | |
| `<leader>j` | n | Prev location list | |
| `<C-a>` | t | Exit terminal | |
| `<leader>a` | n | Replace word in args | |
| `<A-h/j/k/l>` | n | Alt window nav | **Redundant with Ctrl** |
| `<leader>w` | n | Equalize splits | |
| `<leader>ra` | n | Load same-ext files to args | |
| `<leader>rp` | n | Replace word in args | |

---

### 3. Telescope Keybindings (init.lua)

| Key | Action |
|-----|--------|
| `<leader>sh` | Help tags |
| `<leader>sk` | Keymaps |
| `<leader>sf` | Find files |
| `<leader>ss` | Select telescope |
| `<leader>sw` | Search current word |
| `<leader>sg` | Live grep |
| `<leader>sd` | Diagnostics |
| `<leader>sr` | Resume |
| `<leader>s.` | Oldfiles |
| `<leader>sc` | Commands |
| `<leader><leader>` | Buffers |
| `<leader>sn` | Neovim config files |

**LSP-specific (buf local):**
- `grr` - References
- `gri` - Implementations
- `grd` - Definitions
- `gO` - Document symbols
- `gW` - Workspace symbols
- `grt` - Type definitions

---

### 4. Snacks Picker Keybindings (snacks.lua)

| Key | Action |
|-----|--------|
| `<leader><space>` | Smart Find Files |
| `<leader>,` | Buffers |
| `<leader>/` | Grep |
| `<leader>:` | Command History |
| `<leader>n` | Notifications |
| `<leader>e` | File Explorer |
| `<leader>fb` | Buffers |
| `<leader>fc` | Find Config |
| `<leader>ff` | Find Files |
| `<leader>fg` | Git Files |
| `<leader>fp` | Projects |
| `<leader>fr` | Recent |
| `<leader>gb` | Git Branches |
| `<leader>gl` | Git Log |
| `<leader>gL` | Git Log Line |
| `<leader>gs` | Git Status |
| `<leader>gS` | Git Stash |
| `<leader>gd` | Git Diff |
| `<leader>gf` | Git Log File |
| `gd` | LSP Definitions **(CONFLICT)** |
| `gD` | LSP Declarations |
| `gr` | LSP References **(CONFLICT)** |
| `gI` | LSP Implementations |
| `gy` | LSP Type Definitions |

---

### 5. LSP Keybindings (init.lua)

| Key | Action |
|-----|--------|
| `grn` | Rename |
| `gra` | Code action |
| `grD` | Declaration |
| `<leader>th` | Toggle inlay hints |

---

### 6. Harpoon Keybindings (harpoon.lua)

| Key | Action |
|-----|--------|
| `<leader>ha` | Add file |
| `<leader>hm` | Menu |
| `<C-h/j/k/l>` | Select marks 1-4 **(CONFLICTS with window nav)** |
| `<leader>hn` | Next |
| `<leader>hp` | Previous |
| `<leader>ht` | Telescope |

---

### 7. Terminal & Misc (fterm_undotree.lua)

| Key | Action |
|-----|--------|
| `<C-t>` | Toggle terminal |
| `<leader>u` | Undotree |

---

### 8. GitSigns Keybindings

| Key | Action |
|-----|--------|
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hu` | Undo stage |
| `<leader>hR` | Reset buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hd` | Diff against index |
| `<leader>hD` | Diff against last commit |
| `<leader>tb` | Toggle blame |
| `<leader>tD` | Toggle inline diff |

---

### 9. Snacks Toggle Keybindings

| Key | Action |
|-----|--------|
| `<leader>us` | Toggle spell |
| `<leader>uw` | Toggle wrap |
| `<leader>uL` | Toggle relative number |
| `<leader>ud` | Toggle diagnostics |
| `<leader>ul` | Toggle line numbers |
| `<leader>uc` | Toggle conceal |
| `<leader>uT` | Toggle treesitter |
| `<leader>ub` | Toggle background |
| `<leader>uh` | Toggle inlay hints |
| `<leader>ug` | Toggle indent |
| `<leader>uD` | Toggle dim |

---

### 10. Snacks Other

| Key | Action |
|-----|--------|
| `<leader>z` | Zen mode |
| `<leader>Z` | Zoom |
| `<leader>.` | Scratch buffer |
| `<leader>S` | Select scratch |
| `<leader>bd` | Delete buffer |
| `<leader>cR` | Rename file |
| `<leader>gB` | Git browse |
| `<leader>gg` | Lazygit |
| `<leader>un` | Dismiss notifications |
| `<c-/>` | Terminal |
| `]] / [[` | Jump references |
| `<leader>N` | Neovim news |

---

## Recommendations

### 1. Resolve Conflicts

Since both Telescope and Snacks define picker functionality, **choose one**:

**Option A: Disable Snacks pickers** (recommended since you have Telescope):
```lua
-- In snacks.lua, change:
picker = { enabled = false, ... }
```

**Option B: Remove Telescope pickers** (if you prefer Snacks):
- Remove the telescope plugin config

### 2. Fix Harpoon/Window Nav Conflict

`<C-h/j/k/l>` is used for both:
- Window navigation (init.lua:214-217)
- Harpoon marks (harpoon.lua:27-38)

**Suggestion**: Remove Harpoon's Ctrl-based bindings or use different keys:
```lua
-- Change Harpoon to use different keys:
vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end)
vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end)
-- etc.
```

### 3. Remove Redundant Bindings

- **Alt+arrows**: Remove `<A-h/j/k/l>` since Ctrl+arrows already work
- **Duplicate buffers**: Keep only `<leader><leader>` or `<leader>,`

### 4. Consider Removing

- `<leader>a` (replace in args) - rarely used, complex
- `<leader>ra` - rarely used
- `<leader>rp` - rarely used
- `<C-a>` in terminal - uncommon

---

## Default Keybindings Worth Knowing

These are built-in and work without any configuration:

| Key | Action |
|-----|--------|
| `Ctrl+o` | Go back |
| `Ctrl+i` | Go forward |
| `g;` | Go to last edit |
| `gi` | Go to last insert |
| `Ctrl^` | Switch buffer |
| `m[a-z]` | Set mark |
| `'[a-z]` | Go to mark |
| `]p` | Paste under indent |
| `z=` | Spelling suggestions |
