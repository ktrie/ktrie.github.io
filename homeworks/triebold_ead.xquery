declare default element namespace "urn:isbn:1-931666-22-9";

<archive>

{

for $faid in collection("file:/Users/kyratriebold/Desktop/xquery-assignment?select=*.xml")

let $startdate := substring-before($faid/ead/eadheader/filedesc/titlestmt/titleproper/date, '-')
let $enddate := substring-after($faid/ead/eadheader/filedesc/titlestmt/titleproper/date, '-')
let $encoder := $faid/ead/eadheader/filedesc/titlestmt/author
let $accessrestrict := $faid/ead/archdesc/accessrestrict/p

order by number(substring-before(data($faid/ead/archdesc/did/physdesc/extent), ' cubic'))
(: ordered by cubic feet :)

return

<findingaid>
    <eadid>{data($faid/ead/eadheader/eadid)}</eadid>
    <title>{normalize-space(data($faid/ead/eadheader/filedesc/titlestmt/titleproper))}</title>
    <yearscovered>{number($enddate)-number($startdate)}</yearscovered>
    <encoder>{substring-after($encoder, 'by ')}</encoder>
    <revisions>{count($faid/ead/eadheader/revisiondesc//change)}</revisions>
    <extent>
        <cubicfeet>{string-join((substring-before(data($faid/ead/archdesc/did/physdesc/extent), ' cubic'), ' cubic feet'))}</cubicfeet>
        {
        for $extent in $faid/ead/archdesc/did/physdesc/extent
        return 
            if (contains($extent, 'box'))
            then <boxcount>{substring-after($extent,'feet ')}</boxcount>
            else ()
        }
    </extent>
    <accessrestrict>{string-join($accessrestrict, ' | ')}</accessrestrict>
    <indexingterms>
        {
        for $term in $faid/ead/archdesc/controlaccess//corpname|$faid/ead/archdesc/controlaccess//persname|$faid/ead/archdesc/controlaccess//subject
        return <term>{normalize-space(data($term))}</term>
        }
    </indexingterms>
    <files>{count($faid/ead/archdesc/dsc//*[@level='file'])}</files>
</findingaid>

}

</archive>
