
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shoe Enterprise Help Center</title>
    
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    
    <jsp:include page="./WEB-INF/components/Imports.jsp" />
</head>
<body >
    <jsp:include page="./WEB-INF/components/nav.jsp" />
    <!-- Navigation -->
    <nav class="bg-gray-800 py-4">
        <div class="container mx-auto flex justify-between items-center px-4">
            <h1 class="text-white text-xl font-bold">Shoe Enterprise</h1>
            <!-- Add navigation links here if needed -->
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mx-auto mt-8 px-4">
        <h2 class="text-3xl font-semibold mb-4">Help Center</h2>

        <!-- FAQ Section -->
        <div class="mb-8">
            <h3 class="text-xl font-semibold mb-2">Frequently Asked Questions</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="bg-white rounded-lg shadow-md p-6">
                    <h4 class="text-lg font-semibold mb-2">How do I track my order?</h4>
                    <p class="text-gray-700">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac turpis vel mi cursus mattis.</p>
                </div>
                <div class="bg-white rounded-lg shadow-md p-6">
                    <h4 class="text-lg font-semibold mb-2">What payment methods do you accept?</h4>
                    <p class="text-gray-700">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac turpis vel mi cursus mattis.</p>
                </div>
                <!-- Add more FAQ items as needed -->
            </div>
        </div>

        <!-- Contact Section -->
        <div>
            <h3 class="text-xl font-semibold mb-2">Contact Us</h3>
            <p class="text-gray-700 mb-4">Have more questions? Feel free to reach out to us.</p>
            <form class="max-w-lg">
                <div class="mb-4">
                    <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
                    <input type="text" id="name" name="name" class="mt-1 p-2 w-full border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" placeholder="Enter your name">
                </div>
                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                    <input type="email" id="email" name="email" class="mt-1 p-2 w-full border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" placeholder="Enter your email">
                </div>
                <div class="mb-4">
                    <label for="message" class="block text-sm font-medium text-gray-700">Message</label>
                    <textarea id="message" name="message" rows="4" class="mt-1 p-2 w-full border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" placeholder="Enter your message"></textarea>
                </div>
                <button type="submit" class="bg-indigo-500 text-white py-2 px-4 rounded-md hover:bg-indigo-600">Send</button>
            </form>
        </div>
    </div>

    <jsp:include page="./WEB-INF/components/footer.jsp" />
</body>
</html>
