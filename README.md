#xzdb
ZDB service: Search within the Zeitschriftendatenbank (ZDB) and get a JSON represantation of a data snapshot.
## Parameters
  - start: the starting record (default 1)
  - maximum: the maximum number of returning records (default 10)
One of:
  - num: a bibliographic standard number like issn, ppn, zdbid, oclc number
  - q: a sru query string (e.g. title=biology)
  - debug: debugging output for browsers

## Response JSON
  - root: an array of resources (array, madatory, single)
  - resource: an resource object (object, optional, list)
  - ppn: the Pica Production Number of the resource (string, mandatory, single)
  - zdbid: the ZDB-ID of the resource (string, mandatory, single)
  - issn: list of ISSNs of the resource (array, optional, list)
  - issn_auth: list of authorized ISSNs of the resource (array, optional, list)
  - issn_carrier: list of data carrier ISSNs of the resource (array, optional, list)
  - issn_online: list of ISSNs of the online resources (array, optional, list)
  - issn_print: list of ISSNs of the print resources (array, optional, list)
  - issn_wrong: list of wrong ISSNs of the resources (array, optional, list)
  - oclc: OCLC number (string, optional, single)
  - swets: SWETS number  (string, optional, single)
  - supplement: list of supplements to the resource (array, optional, list)
  - container: list of containing resources (array, optional, list)
  - parallel: list of parallel resources (array, optional, list)
  - precessor: list of precessors (array, optional, list)
  - successor: list of successors (array, optional, list)
Values for supplement, container, parallel, precessor and successor:
  - text: preceeding text
  - title: the title of the related resource
  - ppn: the Pica Production Number of the related resource
  - zdbid: the ZDB-ID of the related resource

## Usage Examples
index.php?num=823010209

Response:


    [
        {
            "ppn": "1027830129",
            "zdbid": "2691143-7",
            "oclc": "823010209",
            "precessor": [
                {
                    "text": "Vorg.:",
                    "title": "\u0098Der\u009c MBA-Guide",
                    "zdbid": "2069257-2",
                    "ppn": "023148543"
                }
            ]
        }
    ]

index.php?q=title=soil biology&maximum=2

    [
        {
            "ppn": "98815479X",
            "zdbid": "2419232-6",
            "issn_print": [
                "1819-3498"
            ],
            "oclc": "644251209"
        },
        {
            "ppn": "985542926",
            "zdbid": "2385527-7",
            "issn_print": [
                "1613-3382"
            ],
            "oclc": "723788084",
            "parallel": [
                {
                    "text": "Druckausg.",
                    "title": "Soil biology",
                    "zdbid": "2151755-1",
                    "ppn": "026210169"
                }
            ]
        }
    ]
