import argparse
import fileinput
import re


if __name__ == "__main__":

    argument_parser = argparse.ArgumentParser()
    argument_parser.add_argument('--activator', default="AB4EN", type=str, help='Callsign of the activator')
    argument_parser.add_argument('files', metavar='FILES', nargs='*', help='Files to convert, stdin if none')

    args = argument_parser.parse_args()

    if len(args.files) == 0:
        print("Usage: adif_to_pota.py <exported_adif_filenames>")
        print("Comment fields will be scanned for comments matching POTA <parkidentifier> for your parks and P2P <parkidentifier> for Park to Park contacts.  Sections should be separated with a semicolon")
        exit(0)
    elif len(args.files) > 1:
        print("WARNING: Assumption is that all input files have the same hearder rows")

    header_lines = []
    date_data = {}
    first_file = True

    date_re = re.compile("<QSO_DATE:8>([0-9]{8})")
    comment_re = re.compile("<COMMENT:[0-9]+>([^<]+)+")
    pota_re = re.compile("POTA (\w+-\d+)")
    p2p_re = re.compile("P2P (\w+-\d+)")

    for input_filename in args.files:
        print(f"Processing {input_filename}")

        with open(input_filename, "r") as input_file:
            input_line = input_file.readline()

            while input_line != "<EOH>\n":
                if(first_file):
                    header_lines.append(input_line)

                input_line = input_file.readline()

            if(first_file):
                header_lines.append(input_line)

            first_file = False

            record = []

            input_line = input_file.readline()

            while input_line != "":
                record.append(input_line)

                if input_line == "<EOR>\n":
                    record_date = None
                    activated_park = None

                    modified_record = []

                    # Record is complete.  Find the home for it and push it in.
                    for record_line in record:
                        date_match = date_re.search(record_line)

                        if date_match is not None:
                            record_date = date_match.groups(0)[0]

                        comment_match = comment_re.search(record_line)

                        record_line = comment_re.sub("", record_line)

                        if comment_match is not None:
                            pota_match = pota_re.search(comment_match.groups(0)[0])
                            p2p_match = p2p_re.search(comment_match.groups(0)[0])

                            if pota_match is not None:
                                activated_park = pota_match.groups(0)[0]
                                record_line = record_line + f"<MY_SIG_INFO:{len(activated_park)}>{activated_park}"

                            if p2p_match is not None:
                                park = p2p_match.groups(0)[0]
                                record_line = record_line + f"<SIG_INFO:{len(park)}>{park}"

                        modified_record.append(record_line)

                    if record_date is None:
                        print(f"ERROR: Record found with no date: {record}")
                        exit(-1)

                    if activated_park is None:
                        print(f"ERROR: Record found with no activated park: {record}")
                        exit(-1)                        

                    print(f"{record_date}: {modified_record}")

                    date_records = date_data.get(record_date) or {}

                    park_records = date_records.get(activated_park) or []

                    park_records.append(modified_record)

                    date_records[activated_park] = park_records

                    date_data[record_date] = date_records

                    record = []

                input_line = input_file.readline()

    for date, date_records in date_data.items():
        for park, park_records in date_records.items():
            output_filename = f"{args.activator} @ {park} {date}.ADI"

            print(f"Exporting data to {output_filename}")

            with open(output_filename, "w") as output:
                for line in header_lines:
                    output.write(line)

                print(f"Found {len(park_records)} records")

                for record in park_records:
                    for line in record:
                        output.write(line)


