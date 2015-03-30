
###
    al-with="some.long.path"
###
dirs.with =
    priority: 500
    init: (element, name, scope, env) ->
        self = dirs.if.init element, name, scope, env
        self.insertBlock = (value) ->
            if self.child
                self.removeBlock()
            if not f$.isObject value
                return
            self.item = f$.clone self.base_element
            self.insertDom self.top_element, self.item
            self.child = alight.Scope
                prototype: value
                root: scope.$system.root
                attachParent: scope
            alight.applyBindings self.child, self.item, { skip_attr:env.skippedAttr() }
        self
