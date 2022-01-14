local wk = require('which-key')

wk.setup()

wk.register({
    b = {
        name = 'Buffer',
        n = 'Next',
        p = 'Previous',
        d = 'Delete',
        f = 'Find',
        z = 'Fuzzy',
    },
    s = {
        name = 'Set',
        n = 'Relative numbers',
        w = 'Wrap lines',
        s = 'Spell',
        c = 'Color code highlight',
        l = 'Indent guide lines',
        h = 'Show invisible characters',
    },
    f = {
        name = 'Files',
        s = 'Save',
        f = 'Find',
        g = 'Grep',
    },
    o = {
        name = 'Open',
        e = 'Explorer',
        f = 'File browser',
        p = 'Projects',
        m = 'Media files',
        E = 'Environment variables',
    },
    g = {
        name = 'Git',
        b = 'Branches',
        s = 'Status',
        w = 'Blame',
    }
}, {prefix = '<leader>'})
