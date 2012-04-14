class Code.View extends Code.Class
  @extend
    cache:                                      {}
    engine:                                     "coffee"
    prettyPrint:                                false
    loadPaths:                                  ["app/views"]
    componentSuffix:                            "widget"
    hintClass:                                  "hint"
    hintTag:                                    "figure"
    labelClass:                                 "control-label"
    requiredClass:                              "required"
    requiredAbbr:                               "*"
    requiredTitle:                              "Required"
    errorClass:                                 "error"
    errorTag:                                   "output"
    validClass:                                 null
    optionalClass:                              "optional"
    optionalAbbr:                               ""
    optionalTitle:                              "Optional"
    labelMethod:                                "humanize"
    labelAttribute:                             "toLabel"
    validationMaxLimit:                         255
    defaultTextFieldSize:                       null
    defaultTextAreaWidth:                       300
    allFieldsRequiredByDefault:                 true
    fieldListTag:                               "ol"
    fieldListClass:                             "fields"
    fieldTag:                                   "li"
    separator:                                  "-"
    breadcrumb:                                 " - "
    includeBlankForSelectByDefault:             true
    collectionLabelMethods:                     ["toLabel", "displayName", "fullName", "name", "title", "toString"]
    i18nLookupsByDefault:                       true
    escapeHtmlEntitiesInHintsAndLabels:         false
    renameNestedAttributes:                     true
    inlineValidations:                          true
    autoIdForm:                                 true
    fieldsetClass:                              "fieldset"
    fieldClass:                                 "field control-group"
    validateClass:                              "validate"
    legendClass:                                "legend"
    formClass:                                  "form"
    idEnabledOn:                                ["input", "field"] # %w(field label error hint)
    widgetsPath:                                "shared/widgets"
    navClass:                                   "list-item"
    includeAria:                                true
    activeClass:                                "active"
    navTag:                                     "li"
    termsTag:                                   "dl"
    termClass:                                  "term"
    termKeyClass:                               "key"
    termValueClass:                             "value"
    hintIsPopup:                                false
    listTag:                                    "ul"
    pageHeaderId:                               "header"
    pageTitleId:                                "title"
    autoIdNav:                                  false
    pageSubtitleId:                             "subtitle"
    widgetClass:                                "widget"
    headerClass:                                "header"
    titleClass:                                 "title"
    subtitleClass:                              "subtitle"
    contentClass:                               "content"
    defaultHeaderLevel:                         3
    termSeparator:                              ":"
    richInput:                                  false
    submitFieldsetClass:                        "submit-fieldset"
    addLabel:                                   "+"
    removeLabel:                                "-"
    cycleFields:                                false
    alwaysIncludeHintTag:                       false
    alwaysIncludeErrorTag:                      true
    requireIfValidatesPresence:                 true
    localizeWithNamespace:                      false
    localizeWithNestedModel:                    false
    localizeWithInheritance:                    true
    defaultComponentHeaderLevel:                3
    helpers:                                    []
    metaTags: [
      "description",
      "keywords",
      "author",
      "copyright",
      "category",
      "robots"
    ]
    #store: (store) ->
    #  @_store = store if store
    #  @_store ||= new Code.Store.Memory(name: "view")
    #renderers: {}

  constructor: (context = {}) ->
    @_context = context
    
  test: ->
    return 'testx'
    
  @testClass: () ->
    return 'testClass'


module.exports = Code.View