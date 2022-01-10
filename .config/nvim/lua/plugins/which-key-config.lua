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
    d = {
        name = 'Debug',
        b = 'Toggle breakpoint',
        r = 'Run debugger',
        k = 'Continue debugger',
        l = 'Run last debugger',
        c = 'Stop debugger',
        o = 'Step over',
        i = 'Step into',
        t = 'Step out',
        j = 'Run to cursor',
        u = 'Toggle UI',
        f = {
            name = 'Find',
            p = 'Commands',
            b = 'Breakpoints',
            v = 'Variables',
            f = 'Frames',
        },
    },
    g = {
        name = 'Git',
        b = 'Branches',
        s = 'Status',
        w = 'Blame',
    }
}, {prefix = '<leader>'})
