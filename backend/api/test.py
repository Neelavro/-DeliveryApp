from django.http import JsonResponse
import json
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def handle_post_request(request):
    if request.method == 'POST':
        try:
            # Parse the JSON body
            data = json.loads(request.body)

            # Access the 'list' from the request body
            number_list = data.get('list', [])

            # Process the list (for example, just return it in the response)
            return JsonResponse({'received_list': number_list}, status=200)

        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON'}, status=400)
    else:
        return JsonResponse({'error': 'Only POST method allowed'}, status=405)
