from sota_api import SotaApi
import argparse
import gpxpy
import gpxpy.gpx

def process_region(sota_api, association, region, output_file_name):
    region_data = sota_api.retrieve_region(association, region)

    print(f"Found {len(region_data['summits'])} summits in region {association}/{region}")

    gpx = gpxpy.gpx.GPX()

    for summit in region_data['summits']:
        waypoint = gpxpy.gpx.GPXWaypoint(latitude = summit["latitude"], 
            longitude = summit["longitude"],
            elevation = summit["altM"],
            name = f"{summit['summitCode']}:{summit['points']}",
            description = f"{summit['name']} - {summit['points']}",
            symbol = "Summit"
            )
        
        waypoint.link = f"https://summits.sota.org.uk/summit/{summit['summitCode']}"

        gpx.waypoints.append(waypoint)

    with open(output_file_name, "w") as output_file:
        output_file.write(gpx.to_xml())

if __name__ == "__main__":

    argument_parser = argparse.ArgumentParser()
    argument_parser.add_argument('--association', default="W4K",
        help="Association")
    argument_parser.add_argument('--region', default=None,
        help="Region")
    argument_parser.add_argument('--output', default=None, 
        type=str, help='Output file name')

    args = argument_parser.parse_args()

    association = args.association
    region = args.region
    output_file_name = args.output or f"{association}-{region}.gpx"

    sota_api = SotaApi()

    if region is not None:
        process_region(sota_api, association, region, output_file_name)
    else:
        assoociation_data = sota_api.retrieve_association(association)

        for region in assoociation_data["regions"]:
            region_code = region["regionCode"]
            output_file_name = f"{association}-{region_code}.gpx"
            print(f"Retrieving {association} {region_code} into {output_file_name}")
            process_region(sota_api, association, region_code, output_file_name)