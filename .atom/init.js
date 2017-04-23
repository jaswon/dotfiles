UIFontSize = 15
atom.commands.add('atom-workspace',{
    'ui:increase-font-size': function() {
        UIFontSize += 1
        document.documentElement.style.fontSize = UIFontSize + 'px'
    },
    'ui:decrease-font-size': function() {
        UIFontSize -= 1
        document.documentElement.style.fontSize = UIFontSize + 'px'
    }
})
document.documentElement.style.fontSize = UIFontSize + 'px'
