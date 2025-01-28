[#-- Return le message dans la langue demandée ou la langue par défaut ou la première --]
[#function localized parentContent propertyName lang="fr" defaultLang="fr"]

    [#local result1=""]
    [#local result2=""]
    [#local result3=""]

    [#local children = cmsfn.children(parentContent, "mgnl:contentNode")]

    [#list cmsfn.asNodeList(children) as child]
        [#local childContent = cmsfn.asContentMap(child)]
        [#if childContent == propertyName]
            [#local subChildren = cmsfn.children(childContent)]

            [#if subChildren?? && (subChildren?size > 0)]
                [#local firstContent = subChildren[0]]
                [#local result3 = firstContent.message!]
            [/#if]

            [#list subChildren as subChild]
                [#if subChild.locale?has_content && subChild.locale == lang]
                    [#assign result1 = subChild.message]
                [#elseif subChild.locale?has_content && subChild.locale == defaultLang]
                    [#assign result2 = subChild.message]
                [/#if]
            [/#list]
        [/#if]
    [/#list]

    [#if result1?has_content]
        [#return result1]
    [#elseif result2?has_content]
        [#return result2]
    [#else]
        [#return result3]
    [/#if]

[/#function]
